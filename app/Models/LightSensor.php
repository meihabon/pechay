<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LightSensor extends Model
{
    use HasFactory;

    protected $fillable = [
        'light_intensity',
        'status'
    ];
}
