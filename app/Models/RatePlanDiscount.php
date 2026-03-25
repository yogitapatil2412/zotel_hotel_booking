<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RatePlanDiscount extends Model
{
    protected $fillable = [
        'code',
        'name',
        'type',
        'discount_percent',
        'min_nights',
        'days_before'
    ];
}
