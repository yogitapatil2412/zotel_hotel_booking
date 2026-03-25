<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\RatePlan;
use App\Models\RatePlanDiscount;

class RatePlanDiscountsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {

        $epDiscount = RatePlanDiscount::create([
            'code' => 'EP',
            'name' => 'Early Bird',
            'type' => 'early_bird',
            'discount_percent' => 5,
            'min_nights' => 1,
            'days_before' => 30,
        ]);

        $cpDiscount = RatePlanDiscount::create([
            'code' => 'CP',
            'name' => 'Early Bird',
            'type' => 'early_bird',
            'discount_percent' => 10,
            'min_nights' => 1,
            'days_before' => 30,
        ]);
        $mapDiscount = RatePlanDiscount::create([
            'code' => 'MAP',
            'name' => 'Early Bird',
            'type' => 'early_bird',
            'discount_percent' => 10,
            'min_nights' => 1,
            'days_before' => 30,
        ]);

        RatePlan::where('meal_plan', 'EP')->update(['discount_id' => $epDiscount->id]);
        RatePlan::where('meal_plan', 'CP')->update(['discount_id' => $cpDiscount->id]);
        RatePlan::where('meal_plan', 'MAP')->update(['discount_id' => $mapDiscount->id]);
    }
}
