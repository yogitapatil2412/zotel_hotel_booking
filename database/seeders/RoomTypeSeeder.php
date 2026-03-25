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
                'description' => 'Clean, minimal space with queen bed.',
                'image' => 'standard.jpg',
                'max_occupancy' => 3,
                'total_rooms' => 5,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Deluxe Room',
                'description' => 'Spacious room with premium amenities.',
                'image' => 'deluxe.jpg',
                'max_occupancy' => 4,
                'total_rooms' => 3,
                'created_at' => now(),
                'updated_at' => now(),
            ]
        ]);
    }
}
