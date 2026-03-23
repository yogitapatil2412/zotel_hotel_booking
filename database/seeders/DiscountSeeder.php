<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DiscountSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {
        DB::table('discounts')->insert([

            // LONG STAY
            [
                'type' => 'long_stay',
                'min_nights' => 3,
                'days_before' => null,
                'discount_percent' => 10,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'type' => 'long_stay',
                'min_nights' => 6,
                'days_before' => null,
                'discount_percent' => 20,
                'created_at' => now(),
                'updated_at' => now(),
            ],

            // LAST MINUTE
            [
                'type' => 'last_minute',
                'min_nights' => null,
                'days_before' => 3,
                'discount_percent' => 5,
                'created_at' => now(),
                'updated_at' => now(),
            ],

        ]);
    }
}
