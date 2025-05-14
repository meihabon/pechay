<?php

// Laravel API endpoints for each sensor (Updated URLs)
$apiUrls = [
    'lightSensor' => 'http://pechay.kesug.com/api/lightsensor',
    'soundSensor' => 'http://pechay.kesug.com/api/soundsensor',
    'humidityTemperatureSensor' => 'http://pechay.kesug.com/api/humiditytemperaturesensor',
    'airQualitySensor' => 'http://pechay.kesug.com/api/airqualitysensor'
];

while (true) {
    // Simulated sensor values with updated realistic ranges
    $lightIntensity = rand(100, 2000);       // Lux, broader range for light sensor
    $soundLevel = rand(20, 120);             // dB, includes very low and loud sounds
    $humidity = rand(20, 80);                // % humidity, adjusted to real-world range
    $temperature = rand(10, 40);             // °C, extended to include colder and hotter ranges
    $co2 = rand(300, 1500);                  // ppm, broader CO2 range
    $status = rand(0, 1);                    // Boolean status

    // Prepare payloads
    $payloads = [
        'lightSensor' => [
            'light_intensity' => $lightIntensity,
            'status' => $status
        ],
        'soundSensor' => [
            'value' => $soundLevel,
            'status' => $status
        ],
        'humidityTemperatureSensor' => [
            'humidity' => $humidity,
            'temperature' => $temperature,
            'status' => $status
        ],
        'airQualitySensor' => [
            'co2' => $co2,
            'status' => $status
        ]
    ];

    // Send requests for each sensor
    foreach ($payloads as $sensor => $data) {
        $ch = curl_init($apiUrls[$sensor]);

        curl_setopt_array($ch, [
            CURLOPT_POST => true,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_HTTPHEADER => ['Content-Type: application/json'],
            CURLOPT_POSTFIELDS => json_encode($data),
        ]);

        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);

        // Check if the request was successful
        if ($httpCode == 200) {
            echo "[$sensor] Sent: " . json_encode($data) . "\n";
            echo "Response [$httpCode]: $response\n\n";
        } else {
            // Error handling if request fails
            echo "[$sensor] Error: Failed to send data. HTTP Code: $httpCode\n";
        }
    }

    // Log responses to a file
    $logFile = 'sensor_log.txt';
    $logData = "Timestamp: " . date('Y-m-d H:i:s') . "\n";
    $logData .= json_encode($payloads) . "\n\n";
    file_put_contents($logFile, $logData, FILE_APPEND);

    // Wait before the next iteration (adjusted to 10 seconds)
    sleep(10);
}
?>
