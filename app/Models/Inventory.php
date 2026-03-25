<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Inventory extends Model
{
    protected $fillable = [
        'rate_plan_id',
        'date',
        'available'
    ];

    public function ratePlan()
    {
        return $this->belongsTo(RatePlan::class);
    }
}
