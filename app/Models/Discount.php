<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Discount extends Model
{
    protected $fillable = [
        'type',
        'min_nights',
        'days_before',
        'discount_percent'
    ];
}
