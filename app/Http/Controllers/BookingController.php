<?php

namespace App\Http\Controllers;

use App\Models\Booking;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Str;

class BookingController extends Controller
{
    public function store(Request $request)
    {
        // Generate reference
        $reference = 'ZTL-' . strtoupper(Str::random(8));

        $booking = Booking::create([
            'reference' => $reference,
            'room' => $request->room,
            'plan' => $request->plan,
            'check_in' => $request->check_in,
            'check_out' => $request->check_out,
            'guests' => $request->guests,
            'discount' => $request->discount ?? 0,
            'total_price' => $request->price
        ]);

        return view('booking_confirmed', compact('booking'));
    }
}
