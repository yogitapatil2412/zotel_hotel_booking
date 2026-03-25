<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\RatePlan;
use App\Models\RoomType;

class RatePlansSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $roomTypes = RoomType::all();

        foreach ($roomTypes as $room) {

            // STANDARD ROOM → EP + CP
            if ($room->name === 'Standard Room') {

                RatePlan::insert([
                    [
                        'room_type_id' => $room->id,
                        'code' => 'STANDARD_EP',
                        'name' => 'Room Only',
                        'meal_plan' => 'EP',
                        'base_price' => 2000,
                        'created_at' => now(),
                        'updated_at' => now(),
                    ],
                    [
                        'room_type_id' => $room->id,
                        'code' => 'STANDARD_CP',
                        'name' => 'Breakfast Included',
                        'meal_plan' => 'CP',
                        'base_price' => 2400,
                        'created_at' => now(),
                        'updated_at' => now(),
                    ],
                ]);
            }

            // DELUXE ROOM → CP + MAP
            if ($room->name === 'Deluxe Room') {

                RatePlan::insert([
                    [
                        'room_type_id' => $room->id,
                        'code' => 'DELUXE_CP',
                        'name' => 'Breakfast Included',
                        'meal_plan' => 'CP',
                        'base_price' => 3000,
                        'created_at' => now(),
                        'updated_at' => now(),
                    ],
                    [
                        'room_type_id' => $room->id,
                        'code' => 'DELUXE_MAP',
                        'name' => 'All Meals Included',
                        'meal_plan' => 'MAP',
                        'base_price' => 3800,
                        'created_at' => now(),
                        'updated_at' => now(),
                    ],
                ]);
            }
        }
    }
}
