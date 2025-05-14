<?php

namespace App\Http\Controllers;

use App\Models\AirQualitySensor;
use Illuminate\Http\Request;

class AirQualitySensorController extends Controller
{
    public function index()
    {
        return AirQualitySensor::all();
    }

    public function store(Request $request)
    {
        $request->validate([
            'co2' => 'required|numeric',
            'status' => 'required|boolean',
        ]);

        $sensor = AirQualitySensor::create([
            'co2' => $request->co2,
            'status' => $request->status,
        ]);

        return response()->json($sensor);
    }

    public function show(AirQualitySensor $airQualitySensor)
    {
        return $airQualitySensor;
    }

    public function update(Request $request, AirQualitySensor $airQualitySensor)
    {
        $airQualitySensor->update($request->all());

        return response()->json($airQualitySensor);
    }

    public function destroy(AirQualitySensor $airQualitySensor)
    {
        $airQualitySensor->delete();

        return response()->json(['message' => 'Sensor deleted']);
    }
}
