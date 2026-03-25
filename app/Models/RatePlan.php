<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RatePlan extends Model
{
    protected $fillable = [
        'room_type_id',
        'code',
        'name',
        'meal_plan',
        'base_price',
        'discount_id'
    ];

    public function roomType()
    {
        return $this->belongsTo(RoomType::class);
    }

    public function discount()
    {
        return $this->belongsTo(RatePlanDiscount::class, 'discount_id');
    }

    public function inventories()
    {
        return $this->hasMany(Inventory::class);
    }
}
