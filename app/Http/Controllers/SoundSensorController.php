<?php

namespace App\Http\Controllers;

use App\Models\SoundSensor;
use Illuminate\Http\Request;

class SoundSensorController extends Controller
{
    public function index()
    {
        return SoundSensor::all();
    }

    public function store(Request $request)
    {
        $request->validate([
            'value' => 'required|numeric',
            'status' => 'required|boolean',
        ]);

        $sensor = SoundSensor::create([
            'value' => $request->value,
            'status' => $request->status,
        ]);

        return response()->json($sensor);
    }

    public function show(SoundSensor $soundSensor)
    {
        return $soundSensor;
    }

    public function update(Request $request, SoundSensor $soundSensor)
    {
        $soundSensor->update($request->all());

        return response()->json($soundSensor);
    }

    public function destroy(SoundSensor $soundSensor)
    {
        $soundSensor->delete();

        return response()->json(['message' => 'Sensor deleted']);
    }
}