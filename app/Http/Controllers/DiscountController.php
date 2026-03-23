<?php

namespace App\Http\Controllers;

use App\Models\Discount;
use Illuminate\Http\Request;
use Carbon\Carbon;

class DiscountController extends Controller
{
    public function index()
    {
        $longStay = Discount::where('type', 'long_stay')->get();
        $lastMinute = Discount::where('type', 'last_minute')->get();

        return view('discount', compact('longStay', 'lastMinute'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'discount_percent' => 'required|numeric|min:1|max:100',
            'days_before' => 'nullable|numeric|min:0',
            'min_nights' => 'nullable|numeric|min:1'
        ]);

        $discount = Discount::findOrFail($id);

        $discount->update($request->only([
            'days_before',
            'min_nights',
            'discount_percent'
        ]));

        return redirect()->back()->with('success', 'Updated successfully');
    }
}
