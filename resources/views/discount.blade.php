@extends('layouts.app')

@php
$showSearch = false;
$showBack = true;
$title = 'Discount Configuration';
@endphp

@section('content')

<div class="container py-4">
    @foreach($discount as $d)
    <br>
    <h6 class="section-title">{{ $d->code  }} - {{ $d->name  }}</h6>
    <p class="section-subtitle">Applied when the stay meets minimum night thresholds.</p>
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
                                name="min_nights" class="form-control form-control-sm"
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

</div>

@endsection