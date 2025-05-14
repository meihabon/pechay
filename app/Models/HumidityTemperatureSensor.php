<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HumidityTemperatureSensor extends Model
{
    use HasFactory;

    protected $fillable = [
        'humidity',
        'temperature',
        'status',
    ];
}
