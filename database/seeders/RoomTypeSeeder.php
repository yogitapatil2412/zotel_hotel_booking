<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\RoomType;

class RoomTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        RoomType::insert([
            [
                'name' => 'Standard Room',
                'description' => 'Clean, minimal space with queen bed, work desk, and natural light. 24 sqm.',
                'image' => 'standard.jpg'
            ],
            [
                'name' => 'Deluxe Room',
                'description' => 'Spacious room with king bed, seating area, and panoramic city views. 36 sqm.',
                'image' => 'deluxe.jpg'
            ]
        ]);
    }
}
