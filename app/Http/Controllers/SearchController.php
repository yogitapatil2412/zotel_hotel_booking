<?php

namespace App\Http\Controllers;

use App\Models\Inventory;
use App\Models\Discount;
use App\Models\RatePlan;
use Carbon\Carbon;
use Illuminate\Http\Request;

class SearchController extends Controller
{
    public function index()
    {
        $maxDate = Inventory::max('date');
        $checkIn = Carbon::today();
        $checkOut = Carbon::tomorrow();
        $rooms = array();
        $guests = 1;
        $nights = 1;
        return view('search_results', [
            'maxDate' => $maxDate,
            'rooms' => $rooms,
            'nights' => $nights,
            'guests' => $guests,
            'check_in_input' => $checkIn->format('Y-m-d'),
            'check_out_input' => $checkOut->format('Y-m-d'),
        ]);
    }
    public function search(Request $request)
    {
        $maxDate = Inventory::max('date');
        $check_in = Carbon::parse($request->check_in);
        $check_out = Carbon::parse($request->check_out);
        $guests = $request->guests;
        $nights = $check_in->diffInDays($check_out);

        $daysBefore = now()->diffInDays($check_in, false);

        $inventories = Inventory::with('ratePlan.roomType', 'ratePlan.discount')
            ->whereBetween('date', [$check_in, $check_out->copy()->subDay()])
            ->whereHas('ratePlan.roomType', function ($q) use ($guests) {
                $q->where('max_occupancy', '>=', $guests);
            })
            ->get()
            ->groupBy('rate_plan_id');

        $rooms = [];
        // Collect discount summary per meal plan
        $discountSummary = [];

        $ratePlans = RatePlan::with('discount')->get();


        foreach ($inventories as $planId => $items) {

            $plan = $items->first()->ratePlan;
            $roomType = $plan->roomType;

            if ($items->contains(fn($i) => $i->available <= 0)) continue;

            $totalPrice = 0;

            foreach ($items as $inv) {

                $price = $plan->base_price;

                $totalPrice += $price;
            }

            // Discounts
            $discount = $plan->discount;
            $discountPercent = 0;

            if ($discount) {
                if ($nights >= $discount->min_nights) {
                    $discountPercent = $discount->discount_percent;

                    // discount summary 
                    $meal = $plan->meal_plan;
                    $percent = $plan->discount->discount_percent;

                    if (!isset($discountSummary[$meal])) {
                        $discountSummary[$meal] = $percent;
                    } else {
                        $discountSummary[$meal] = max($discountSummary[$meal], $percent);
                    }
                }
            }
            $finalPrice = round($totalPrice * (1 - $discountPercent / 100));

            $rooms[$roomType->id]['name'] = $roomType->name;
            $rooms[$roomType->id]['image'] = $roomType->image;
            $rooms[$roomType->id]['max_occupancy'] = $roomType->max_occupancy;
            $rooms[$roomType->id]['plans'][] = [
                'type' => $plan->name,
                'old_price' => $totalPrice,
                'price' => $finalPrice,
                'discount' => $discountPercent
            ];
        }

        $check_in_input = $check_in;
        $check_out_input = $check_out;

        return view('search_results', compact(
            'maxDate',
            'rooms',
            'nights',
            'guests',
            'discountSummary',
            'check_in_input',
            'check_out_input'
        ));
    }
}
