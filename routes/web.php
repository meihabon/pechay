<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\SensorController; // Your controller to fetch and display sensor data

Route::get('/sensors', [SensorController::class, 'index']); // Show all sensors
