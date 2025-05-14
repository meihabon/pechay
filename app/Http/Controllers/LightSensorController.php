<?php

namespace App\Http\Controllers;

use App\Models\LightSensor;
use Illuminate\Http\Request;

class LightSensorController extends Controller
{
    public function index()
    {
        return LightSensor::all();
    }

    public function store(Request $request)
    {
        $request->validate([
            'light_intensity' => 'required|numeric',
            'status' => 'required|boolean',
        ]);

        $sensor = LightSensor::create([
            'light_intensity' => $request->light_intensity,
            'status' => $request->status,
        ]);

        return response()->json($sensor);
    }

    public function show(LightSensor $lightSensor)
    {
        return $lightSensor;
    }

    public function update(Request $request, LightSensor $lightSensor)
    {
        $lightSensor->update($request->all());

        return response()->json($lightSensor);
    }

    public function destroy(LightSensor $lightSensor)
    {
        $lightSensor->delete();

        return response()->json(['message' => 'Sensor deleted']);
    }
}
