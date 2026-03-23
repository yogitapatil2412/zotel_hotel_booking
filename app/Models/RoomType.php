<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RoomType extends Model
{
    protected $fillable = ['name', 'image'];

    public function inventories()
    {
        return $this->hasMany(Inventory::class);
    }
}
