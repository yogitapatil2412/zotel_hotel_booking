@extends('layouts.app')

@php
$showSearch = false;
$showBack = true;
$title = 'Discount Configuration';
@endphp

@section('content')

<div class="container py-4">

    <!-- LONG STAY -->
    <h6 class="section-title">LONG STAY DISCOUNTS</h6>
    <p class="section-subtitle">Applied when the stay meets minimum night thresholds.</p>

    @foreach($longStay as $d)
    <div class="discount-card" data-id="{{ $d->id }}">
        <div class="view-mode d-flex justify-content-between align-items-center">
            <div class="d-flex gap-3 align-items-center">
                <span class="badge bg-success-subtle text-success">
                    {{ $d->discount_percent }}%
                </span>
                <span>{{ $d->min_nights }}+ nights</span>
            </div>
            <i class="bi bi-pencil edit-btn" style="cursor:pointer;"></i>
        </div>

        <div class="edit-mode d-none">

            <form method="POST" action="{{ route('config.update', $d->id) }}">
                @csrf

                <div class="d-flex justify-content-between align-items-center">

                    <div class="d-flex gap-4">
                        <div>
                            <label class="form-label small text-muted mb-1">
                                Min Nights
                            </label>
                            <input type="number"
                                name="min_nights"=class="form-control form-control-sm"
                                value="{{ $d->min_nights }}">
                        </div>
                        <div>
                            <label class="form-label small text-muted mb-1">
                                Discount %
                            </label>
                            <input type="number"
                                name="discount_percent"
                                class="form-control form-control-sm"
                                value="{{ $d->discount_percent }}">
                        </div>

                    </div>

                    <button type="submit" class="btn btn-dark btn-sm rounded-circle">
                        <i class="bi bi-check"></i>
                    </button>

                </div>

            </form>

        </div>

    </div>
    @endforeach


    <!-- LAST MINUTE -->
    <h6 class="section-title mt-4">LAST MINUTE DISCOUNTS</h6>
    <p class="section-subtitle">Applied when check-in is within a specified number of days from today.</p>

    @foreach($lastMinute as $d)
    <div class="discount-card" data-id="{{ $d->id }}">

        <div class="view-mode d-flex justify-content-between align-items-center">
            <div class="d-flex gap-3 align-items-center">
                <span class="badge bg-warning-subtle text-warning">
                    {{ $d->discount_percent }}%
                </span>
                <span>Check-in within {{ $d->days_before }} days</span>
            </div>
            <i class="bi bi-pencil edit-btn"></i>
        </div>

        <div class="edit-mode d-none">

            <form method="POST" action="{{ route('config.update', $d->id) }}">
                @csrf

                <div class="d-flex justify-content-between align-items-center">

                    <div class="d-flex gap-4">

                        <div>
                            <label class="form-label small text-muted mb-1">
                                Days Ahead
                            </label>
                            <input type="number"
                                name="days_before"
                                class="form-control form-control-sm"
                                value="{{ $d->days_before }}">
                        </div>
                        <div>
                            <label class="form-label small text-muted mb-1">
                                Discount %
                            </label>
                            <input type="number"
                                name="discount_percent"
                                class="form-control form-control-sm"
                                value="{{ $d->discount_percent }}">
                        </div>

                    </div>

                    <button type="submit" class="btn btn-dark btn-sm rounded-circle">
                        <i class="bi bi-check"></i>
                    </button>

                </div>

            </form>

        </div>

    </div>
    @endforeach

</div>

@endsection