@extends('layouts.app')

@section('content')

<div class="container py-5 text-center">

    <div class="card mx-auto p-4 shadow-sm" style="max-width: 500px;">

        <div class="mb-3 text-success fs-1">
            <i class="bi bi-check-circle-fill"></i>
        </div>

        <h4 class="fw-bold mb-1">Booking Confirmed</h4>

        <p class="text-muted mb-3">
            Ref: <strong>{{ $booking->reference }}</strong>
        </p>

        <hr>

        <div class="text-start">

            <div class="d-flex justify-content-between mb-2">
                <span>Room</span>
                <strong>{{ $booking->room }}</strong>
            </div>

            <div class="d-flex justify-content-between mb-2">
                <span>Plan</span>
                <strong>{{ $booking->plan }}</strong>
            </div>

            <div class="d-flex justify-content-between mb-2">
                <span>Dates</span>
                <strong>
                    {{ \Carbon\Carbon::parse($booking->check_in)->format('d M') }}
                    –
                    {{ \Carbon\Carbon::parse($booking->check_out)->format('d M') }}
                </strong>
            </div>

            <div class="d-flex justify-content-between mb-2">
                <span>Guests</span>
                <strong>{{ $booking->guests }} adult</strong>
            </div>

            @if($booking->discount)
            <div class="d-flex justify-content-between text-success mb-2">
                <span>Discount</span>
                <strong>-{{ $booking->discount }}%</strong>
            </div>
            @endif

            <hr>

            <div class="d-flex justify-content-between fs-5 fw-bold">
                <span>Total</span>
                <span>₹{{ number_format($booking->total_price) }}</span>
            </div>

        </div>

        <a href="{{ url('/') }}" class="btn btn-dark w-100 mt-4">
            Make Another Booking
        </a>

    </div>

</div>

@endsection