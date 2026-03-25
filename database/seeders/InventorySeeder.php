<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use App\Models\RoomType;
use App\Models\RatePlan;
use App\Models\Inventory;

class InventorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $plans = RatePlan::with('roomType')->get();

        $start = \Carbon\Carbon::create(2026, 3, 25);
        $end   = \Carbon\Carbon::create(2026, 4, 24);

        $data = [];

        while ($start->lte($end)) {

            foreach ($plans as $plan) {

                $data[] = [
                    'rate_plan_id' => $plan->id,
                    'date' => $start->toDateString(),
                    'available' => $plan->roomType->total_rooms,
                    'created_at' => now(),
                    'updated_at' => now(),
                ];
            }

            $start->addDay();
        }

        DB::table('inventories')->insert($data);
    }
}
