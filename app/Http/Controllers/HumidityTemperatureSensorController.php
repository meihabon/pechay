<?php

namespace App\Http\Controllers;

use App\Models\HumidityTemperatureSensor;
use Illuminate\Http\Request;

class HumidityTemperatureSensorController extends Controller
{
    public function index()
    {
        return HumidityTemperatureSensor::all();
    }

    public function store(Request $request)
    {
        $request->validate([
            'humidity' => 'required|numeric',
            'temperature' => 'required|numeric',
            'status' => 'required|boolean',
        ]);

        $sensor = HumidityTemperatureSensor::create([
            'humidity' => $request->humidity,
            'temperature' => $request->temperature,
            'status' => $request->status,
        ]);

        return response()->json($sensor);
    }

    public function show(HumidityTemperatureSensor $humidityTemperatureSensor)
    {
        return $humidityTemperatureSensor;
    }

    public function update(Request $request, HumidityTemperatureSensor $humidityTemperatureSensor)
    {
        $humidityTemperatureSensor->update($request->all());

        return response()->json($humidityTemperatureSensor);
    }

    public function destroy(HumidityTemperatureSensor $humidityTemperatureSensor)
    {
        $humidityTemperatureSensor->delete();

        return response()->json(['message' => 'Sensor deleted']);
    }
}
