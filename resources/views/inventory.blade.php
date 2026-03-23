@extends('layouts.app')

@php
$showSearch = false;
$showBack = true;
$title = 'Inventory & Pricing';
@endphp

@section('content')

<div class="container py-4">

    <ul class="nav nav-pills custom-tabs mb-4">

        <li class="nav-item w-50">
            <button class="nav-link active w-100"
                data-bs-toggle="tab"
                data-bs-target="#standard">
                Standard Room
            </button>
        </li>

        <li class="nav-item w-50">
            <button class="nav-link w-100"
                data-bs-toggle="tab"
                data-bs-target="#deluxe">
                Deluxe Room
            </button>
        </li>

    </ul>

    <div class="tab-content">

        <!-- ---------------------- STANDARD ---------------------- -->
        <div class="tab-pane fade show active" id="standard">

            @if($standardRooms->count())

            <div class="table-responsive">
                <table class="table">

                    <thead class="table-light">
                        <tr>
                            <th>Room Type</th>
                            <th>Date</th>
                            <th>Avail.</th>
                            <th>1 Person</th>
                            <th>2 Persons</th>
                            <th>3 Persons</th>
                            <th>Breakfast</th>
                        </tr>
                    </thead>

                    <tbody>
                        @foreach($standardRooms as $item)
                        <tr>
                            <td>{{ $item->roomType->name }}</td>
                            <td>
                                {{ \Carbon\Carbon::parse($item->date)->format('d M Y') }} <br>
                                <small>
                                    {{ \Carbon\Carbon::parse($item->date)->format('D') }}
                                    @if(\Carbon\Carbon::parse($item->date)->isToday())
                                    · Today
                                    @endif
                                </small>
                            </td>

                            <td>{{ $item->available }}</td>

                            <td>₹{{ number_format($item->price_1_person) }}</td>
                            <td>₹{{ number_format($item->price_2_person) }}</td>
                            <td>₹{{ number_format($item->price_3_person) }}</td>
                            <td>₹{{ number_format($item->breakfast_price) }}</td>
                        </tr>
                        @endforeach
                    </tbody>

                </table>
            </div>

            @else
            <p>No data available</p>
            @endif

        </div>


        <!-- ---------------------- DELUXE ---------------------- -->
        <div class="tab-pane fade" id="deluxe">

            @if($deluxeRooms->count())


            <div class="table-responsive">
                <table class="table">

                    <thead class="table-light">
                        <tr>
                            <th>Room Type</th>
                            <th>Date</th>
                            <th>Avail.</th>
                            <th>1 Person</th>
                            <th>2 Persons</th>
                            <th>3 Persons</th>
                            <th>Breakfast</th>
                        </tr>
                    </thead>

                    <tbody>
                        @foreach($deluxeRooms as $item)
                        <tr>
                            <td>{{ $item->roomType->name }}</td>
                            <td>
                                {{ \Carbon\Carbon::parse($item->date)->format('d M Y') }} <br>
                                <small>
                                    {{ \Carbon\Carbon::parse($item->date)->format('D') }}
                                    @if(\Carbon\Carbon::parse($item->date)->isToday())
                                    · Today
                                    @endif
                                </small>
                            </td>

                            <td>{{ $item->available }}</td>

                            <td>₹{{ number_format($item->price_1_person) }}</td>
                            <td>₹{{ number_format($item->price_2_person) }}</td>
                            <td>₹{{ number_format($item->price_3_person) }}</td>
                            <td>₹{{ number_format($item->breakfast_price) }}</td>
                        </tr>
                        @endforeach
                    </tbody>

                </table>
            </div>

            @else
            <p>No data available</p>
            @endif

        </div>

    </div>

</div>

@endsection