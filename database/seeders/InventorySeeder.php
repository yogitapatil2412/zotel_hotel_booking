<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use App\Models\RoomType;

class InventorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {
        $standard = RoomType::where('name', 'Standard Room')->first();
        $deluxe = RoomType::where('name', 'Deluxe Room')->first();
        $start = Carbon::create(2026, 3, 23);
        $end = Carbon::create(2026, 4, 21);

        $data = [];

        while ($start->lte($end)) {

            $data[] = [
                'room_type_id' => $standard->id,
                'date' => $start->toDateString(),
                'available' => 5,
                'price_1_person' => 2000,
                'price_2_person' => 2500,
                'price_3_person' => 3000,
                'breakfast_price' => 400,
                'created_at' => now(),
                'updated_at' => now(),
            ];

            $data[] = [
                'room_type_id' => $deluxe->id,
                'date' => $start->toDateString(),
                'available' => 3,
                'price_1_person' => 3000,
                'price_2_person' => 3500,
                'price_3_person' => 4000,
                'breakfast_price' => 500,
                'created_at' => now(),
                'updated_at' => now(),
            ];

            $start->addDay();
        }

        DB::table('inventories')->insert($data);
    }
}
