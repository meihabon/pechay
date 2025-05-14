<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SoundSensor extends Model
{
    use HasFactory;

    protected $fillable = [
        'value',
        'status',
    ];
}
