<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\LightSensorController;
use App\Http\Controllers\SoundSensorController;
use App\Http\Controllers\HumidityTemperatureSensorController;
use App\Http\Controllers\AirQualitySensorController;

Route::apiResource('lightsensor', LightSensorController::class);
Route::apiResource('soundsensor', SoundSensorController::class);
Route::apiResource('humiditytemperaturesensor', HumidityTemperatureSensorController::class);
Route::apiResource('airqualitysensor', AirQualitySensorController::class);
Route::get('/light-sensors/{lightSensor}', [LightSensorController::class, 'show']);
Route::put('/light-sensors/{lightSensor}', [LightSensorController::class, 'update']);
