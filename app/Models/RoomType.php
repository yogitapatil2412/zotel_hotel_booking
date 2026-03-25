<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RoomType extends Model
{
    protected $fillable = ['name', 'description', 'image', 'max_occupancy', 'total_rooms'];

    public function ratePlans()
    {
        return $this->hasMany(RatePlan::class);
    }
}
