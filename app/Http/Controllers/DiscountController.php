<?php

namespace App\Http\Controllers;

use App\Models\Discount;
use App\Models\RatePlanDiscount;
use Illuminate\Http\Request;
use Carbon\Carbon;

class DiscountController extends Controller
{
    public function index()
    {
        $discount = RatePlanDiscount::get();

        return view('discount', compact('discount'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'discount_percent' => 'required|numeric|min:1|max:100',
            'min_nights' => 'nullable|numeric|min:1'
        ]);

        $discount = RatePlanDiscount::findOrFail($id);
        $discount->update($request->only([
            'min_nights',
            'discount_percent'
        ]));

        return redirect()->back()->with('success', 'Updated successfully');
    }
}
