<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    protected $fillable = [
        'reference',
        'room',
        'plan',
        'check_in',
        'check_out',
        'guests',
        'discount',
        'total_price'
    ];
}
