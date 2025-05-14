<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\LightSensor;
use App\Models\SoundSensor;
use App\Models\HumidityTemperatureSensor;
use App\Models\AirQualitySensor;

class SensorController extends Controller
{
    public function index()
    {
        return view('index', [
            'lightSensors' => LightSensor::latest()->take(20)->get(),
            'soundSensors' => SoundSensor::latest()->take(20)->get(),
            'humidityTemperatureSensors' => HumidityTemperatureSensor::latest()->take(20)->get(),
            'airQualitySensors' => AirQualitySensor::latest()->take(20)->get(),
        ]);
    }
}
