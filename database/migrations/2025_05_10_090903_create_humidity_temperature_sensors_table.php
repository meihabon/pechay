<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHumidityTemperatureSensorsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('humidity_temperature_sensors', function (Blueprint $table) {
            $table->id();
            $table->float('humidity');  // Humidity percentage
            $table->float('temperature');  // Temperature in Celsius
            $table->boolean('status');  
            $table->timestamps();  
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('humidity_temperature_sensors');
    }
}
