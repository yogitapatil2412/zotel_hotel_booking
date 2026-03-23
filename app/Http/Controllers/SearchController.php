<?php

namespace App\Http\Controllers;

use App\Models\Inventory;
use App\Models\Discount;
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
            'longStayApplied' => 0,
            'lastMinuteApplied' => 0,
            'check_in_input' => $checkIn->format('Y-m-d'),
            'check_out_input' => $checkOut->format('Y-m-d'),
        ]);
    }
    public function search(Request $request)
    {
        $maxDate = Inventory::max('date');
        $check_in  = Carbon::parse($request->check_in);
        $check_out = Carbon::parse($request->check_out);
        $guests    = (int) $request->guests;

        // Nights count
        $nights = $check_in->diffInDays($check_out);

        // ================= FETCH INVENTORY =================
        $inventories = Inventory::with('roomType')
            ->whereBetween('date', [$check_in, $check_out->copy()->subDay()])
            ->get()
            ->groupBy('room_type_id');

        // ================= FETCH DISCOUNTS =================
        $longStayDiscounts   = Discount::where('type', 'long_stay')->get();
        $lastMinuteDiscounts = Discount::where('type', 'last_minute')->get();

        // ================= CALCULATE DISCOUNTS =================
        $longStayApplied   = 0;
        $lastMinuteApplied = 0;

        // LONG STAY
        foreach ($longStayDiscounts as $d) {
            if ($nights >= $d->min_nights) {
                $longStayApplied = max($longStayApplied, $d->discount_percent);
            }
        }

        // LAST MINUTE
        $daysBefore = now()->diffInDays($check_in, false);

        foreach ($lastMinuteDiscounts as $d) {
            if ($daysBefore <= $d->days_before) {
                $lastMinuteApplied = max($lastMinuteApplied, $d->discount_percent);
            }
        }

        // FINAL DISCOUNT (highest wins)
        $discountPercent = max($longStayApplied, $lastMinuteApplied);


        $rooms = [];

        foreach ($inventories as $roomTypeId => $items) {

            $roomType = $items->first()->roomType;

            // Skip if any date unavailable
            if ($items->contains(fn($i) => $i->available <= 0)) {
                continue;
            }

            $roomOnly = 0;
            $withBreakfast = 0;

            foreach ($items as $item) {

                // Guest pricing
                if ($guests == 1) {
                    $base = $item->price_1_person;
                } elseif ($guests == 2) {
                    $base = $item->price_2_person;
                } else {
                    $base = $item->price_3_person;
                }

                $roomOnly += $base;
                $withBreakfast += ($base + $item->breakfast_price);
            }

            // Apply discounts step by step
            $roomOnlyAfterLongStay = $roomOnly * (1 - $longStayApplied / 100);
            $roomOnlyFinal = $roomOnlyAfterLongStay * (1 - $lastMinuteApplied / 100);

            $breakfastAfterLongStay = $withBreakfast * (1 - $longStayApplied / 100);
            $breakfastFinal = $breakfastAfterLongStay * (1 - $lastMinuteApplied / 100);

            // Round
            $roomOnlyFinal = round($roomOnlyFinal);
            $breakfastFinal = round($breakfastFinal);

            // Push data
            $rooms[] = [
                'name' => $roomType->name,
                'image' => $roomType->image,
                'description' => $roomType->description,
                'plans' => [
                    [
                        'type' => 'Room Only',
                        'old_price' => $roomOnly,
                        'price' => $roomOnlyFinal,
                        'long_discount' => $longStayApplied,
                        'last_discount' => $lastMinuteApplied
                    ],
                    [
                        'type' => 'With Breakfast',
                        'old_price' => $withBreakfast,
                        'price' => $breakfastFinal,
                        'long_discount' => $longStayApplied,
                        'last_discount' => $lastMinuteApplied
                    ]
                ]
            ];
        }

        $check_in_input = $check_in;
        $check_out_input = $check_out;
        return view('search_results', compact(
            'maxDate',
            'rooms',
            'nights',
            'guests',
            'longStayApplied',
            'lastMinuteApplied',
            'check_in_input',
            'check_out_input'
        ));
    }
}
