<?php

namespace App\Http\Controllers;

use App\Models\Inventory;
use App\Models\RoomType;
use Carbon\Carbon;

class InventoryController extends Controller
{
    public function index()
    {
        $inventories = \App\Models\Inventory::with([
            'ratePlan.roomType'
        ])
            ->orderBy('date')
            ->get()
            ->groupBy(fn($item) => $item->ratePlan->roomType->name);

        return view('inventory', compact('inventories'));
    }
}
