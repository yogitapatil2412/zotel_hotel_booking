@extends('layouts.app')
@php
$showSearch = true;
$showBack = false;
$title = null;
@endphp
@section('content')

<div class="container py-4">

    @if(count($rooms) > 0)

    <h5 class="fw-semibold">
        Select your stay at Zotel Demo Property
    </h5>

    <p class="text-muted">
        {{ $nights }} night{{ $nights > 1 ? 's' : '' }} ·
        {{ $guests }} adult{{ $guests > 1 ? 's' : '' }}

        @if($longStayApplied)
        · {{ $longStayApplied }}% long stay discount
        @endif

        @if($lastMinuteApplied)
        · {{ $lastMinuteApplied }}% last minute deal
        @endif
    </p>
    @endif
    @forelse($rooms as $room)

    <div class="card mb-4 shadow-sm rounded-3 overflow-hidden">

        <div class="row g-0">

            <div class="col-md-4">
                <img src="{{ asset('images/' . $room['image']) }}"
                    class="img-fluid h-100 w-100 object-fit-cover">
            </div>

            <div class="col-md-8 p-4">

                <h5 class="fw-semibold mb-2">
                    {{ $room['name'] }}
                </h5>

                <p class="text-muted small mb-4">
                    {{ $room['description'] }}
                </p>

                @foreach($room['plans'] as $plan)

                <div class="d-flex justify-content-between align-items-center border-top py-3">

                    <div>

                        <div class="fw-medium mb-1">
                            {{ $plan['type'] }}
                        </div>

                        <div class="small text-muted">

                            {{-- Long Stay --}}
                            @if($plan['long_discount'] > 0)
                            <span class="badge bg-success-subtle text-success">
                                -{{ $plan['long_discount'] }}%
                            </span>
                            @endif

                            {{-- Last Minute --}}
                            @if($plan['last_discount'] > 0)
                            <span class="badge bg-warning-subtle text-warning">
                                -{{ $plan['last_discount'] }}%
                            </span>
                            @endif

                            {{-- Old Price --}}
                            <span class="text-decoration-line-through ms-1">
                                ₹{{ number_format($plan['old_price']) }}
                            </span>

                        </div>

                    </div>

                    <!-- PRICE -->
                    <div class="text-end">

                        <div class="fw-semibold fs-5">
                            ₹{{ number_format($plan['price']) }}
                        </div>

                        <small class="text-muted">
                            {{ $nights }} night{{ $nights > 1 ? 's' : '' }}
                        </small>

                    </div>

                    <button
                        class="btn btn-dark btn-sm px-4 select-btn"
                        data-room="{{ $room['name'] }}"
                        data-plan="{{ $plan['type'] }}"
                        data-price="{{ $plan['price'] }}"
                        data-old="{{ $plan['old_price'] }}">
                        Select
                    </button>

                </div>

                @endforeach

            </div>

        </div>

    </div>

    @empty

    <div class="d-flex flex-column align-items-center justify-content-center text-center py-5">

        <div class="icon-circle mb-3">
            <i class="bi bi-search fs-4"></i>
        </div>

        <h4 class="fw-bold">Zotel Demo Property</h4>

        <p class="text-muted mb-3">
            Select your dates and number of guests, then search to see <br> available rooms with transparent pricing.
        </p>

        <div>
            <a href="{{ route('config.index') }}" class="btn btn-outline-secondary me-2 rounded-pill">
                <i class="bi bi-gear me-1"></i> Discounts
            </a>

            <a href="{{ route('inventory.index') }}" class="btn btn-outline-secondary rounded-pill">
                <i class="bi bi-grid me-1"></i> Inventory
            </a>
        </div>

    </div>

    @endforelse
    <div id="staySummary" class="stay-summary d-none">

        <form method="POST" action="{{ route('booking.store') }}">
            @csrf

            <input type="hidden" name="room" id="formRoom">
            <input type="hidden" name="plan" id="formPlan">
            <input type="hidden" name="price" id="formPrice">
            <input type="hidden" name="check_in" value="{{ request('check_in') }}">
            <input type="hidden" name="check_out" value="{{ request('check_out') }}">
            <input type="hidden" name="guests" value="{{ $guests }}">
            <input type="hidden" name="long_discount" value="{{ $longStayApplied }}">
            <input type="hidden" name="last_discount" value="{{ $lastMinuteApplied }}">

            <div class="container d-flex justify-content-between align-items-center">

                <div>
                    <h6 class="mb-1">Stay Summary</h6>

                    <div id="summaryRoom" class="fw-medium small"></div>

                    <div class="text-muted small">
                        {{ \Carbon\Carbon::parse(request('check_in'))->format('d M') }}
                        –
                        {{ \Carbon\Carbon::parse(request('check_out'))->format('d M Y') }}
                        · {{ $guests }} adult · {{ $nights }} nights
                    </div>

                    <span id="savedAmount" class="text-success small"></span>
                    <span id="summaryPrice" class="fw-bold fs-5"></span>
                </div>

                <div class="text-end">
                    <div class="d-flex gap-2 mt-1">
                        <button type="button" id="clearBtn" class="btn btn-light btn-sm">
                            Clear
                        </button>

                        <button type="submit" class="btn btn-dark btn-sm">
                            Book Now
                        </button>
                    </div>

                </div>

            </div>

        </form>

    </div>

</div>

@endsection