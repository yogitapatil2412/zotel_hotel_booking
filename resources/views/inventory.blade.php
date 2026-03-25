@extends('layouts.app')

@php
$showSearch = false;
$showBack = true;
$title = 'Inventory & Pricing';
@endphp

@section('content')

<div class="container py-4">

    {{-- Dynamic Tabs --}}
    <ul class="nav nav-pills mb-4">

        @foreach($inventories as $roomName => $items)
        <li class="nav-item w-50">
            <button class="nav-link {{ $loop->first ? 'active' : '' }} w-100"
                data-bs-toggle="tab"
                data-bs-target="#tab-{{ Str::slug($roomName) }}">
                {{ $roomName }}
            </button>
        </li>
        @endforeach

    </ul>

    <div class="tab-content">

        @foreach($inventories as $roomName => $items)

        <div class="tab-pane fade {{ $loop->first ? 'show active' : '' }}"
            id="tab-{{ Str::slug($roomName) }}">

            @if($items->count())

            <div class="table-responsive">
                <table class="table">

                    <thead class="table-light">
                        <tr>
                            <th>Room Type</th>
                            <th>Rate Plan</th>
                            <th>Date</th>
                            <th>Max Occupancy</th>
                            <th>Base Price</th>
                        </tr>
                    </thead>

                    <tbody>

                        @foreach($items as $item)

                        @php
                        $plan = $item->ratePlan;
                        $room = $plan->roomType;
                        $date = \Carbon\Carbon::parse($item->date);

                        @endphp

                        <tr>
                            <td>{{ $room->name }}</td>
                            <td>
                                {{ $plan->name }}
                                <small class="text-muted">({{ $plan->meal_plan }})</small>
                            </td>

                            <td>
                                {{ \Carbon\Carbon::parse($item->date)->format('d M Y') }}
                                <br>
                                <small>
                                    {{ \Carbon\Carbon::parse($item->date)->format('D') }}
                                    @if($date->isToday())
                                    · Today
                                    @endif
                                </small>
                            </td>

                            <td>{{ $plan->roomType->max_occupancy }}</td>

                            <td>₹{{ number_format($plan->base_price) }}</td>

                        </tr>

                        @endforeach

                    </tbody>

                </table>
            </div>

            @else
            <p>No data available</p>
            @endif

        </div>

        @endforeach

    </div>

</div>

@endsection