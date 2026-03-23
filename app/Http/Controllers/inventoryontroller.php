<?php

namespace App\Http\Controllers;

use App\Models\Inventory;
use App\Models\RoomType;
use Carbon\Carbon;

class inventoryontroller extends Controller
{
    public function index()
    {
        $standard = RoomType::where('name', 'Standard Room')->first();
        $deluxe   = RoomType::where('name', 'Deluxe Room')->first();

        $standardRooms = Inventory::with('roomType')
            ->where('room_type_id', $standard->id)
            ->orderBy('date')
            ->get();

        $deluxeRooms = Inventory::with('roomType')
            ->where('room_type_id', $deluxe->id)
            ->orderBy('date')
            ->get();

        return view('inventory', compact('standardRooms', 'deluxeRooms'));
    }
}
