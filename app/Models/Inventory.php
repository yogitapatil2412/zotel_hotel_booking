<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Inventory extends Model
{
    protected $fillable = [
        'room_type',
        'date',
        'available',
        'price_1',
        'price_2',
        'price_3',
        'breakfast'
    ];
    public function roomType()
    {
        return $this->belongsTo(RoomType::class);
    }
}
