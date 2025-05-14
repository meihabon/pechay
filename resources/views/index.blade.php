<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>🌸 Sensor Dashboard</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #fdf6f0;
        }
        .navbar {
            background: linear-gradient(90deg, #f6d365 0%, #fda085 100%);
        }
        .sensor-card {
            border-radius: 1rem;
            border: none;
            background: #fff8f0;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .sensor-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 25px rgba(0, 0, 0, 0.08);
            background-color: #fff3ea;
        }
        .sensor-card h5 {
            font-weight: 600;
            color: #ff7e5f;
        }
        .back-button {
            color: #ff7e5f;
            font-weight: 600;
            cursor: pointer;
            transition: color 0.3s ease;
        }
        .back-button:hover {
            color: #eb5757;
        }
        .table {
            border-radius: 0.75rem;
            overflow: hidden;
        }
        canvas {
            background: #fff;
            border-radius: 1rem;
            padding: 1rem;
        }
        .metrics {
            font-style: italic;
            color: #888;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light mb-5 shadow-sm">
        <div class="container">
            <span class="navbar-brand fw-bold text-white">🌼 Sensor Dashboard</span>
        </div>
    </nav>

    <!-- Main Graph (combined for all sensors) -->
    <div class="container mb-5">
        <h3 class="fw-bold mb-4 text-secondary">📊 All Sensors Combined</h3>
        <canvas id="mainChart" class="mb-5 shadow-sm"></canvas>
    </div>

    <!-- Preview Cards -->
    <div class="container">
        <div class="row g-4">
            <div class="col-md-3">
                <div class="card sensor-card text-center p-4" onclick="showSensor('light')">
                    <h5>🌞 Light Sensor</h5>
                    <p class="metrics">Units: Lux</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card sensor-card text-center p-4" onclick="showSensor('sound')">
                    <h5>🔊 Sound Sensor</h5>
                    <p class="metrics">Units: dB (Decibels)</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card sensor-card text-center p-4" onclick="showSensor('humidity')">
                    <h5>💧 Humidity & Temp</h5>
                    <p class="metrics">Units: Humidity (%), Temperature (°C)</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card sensor-card text-center p-4" onclick="showSensor('air')">
                    <h5>🍃 Air Quality</h5>
                    <p class="metrics">Units: CO₂ (ppm)</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Sensor Details -->
    <div id="sensorDetails" class="container mt-5 d-none">
        <div class="mb-4">
            <span class="back-button" onclick="hideSensor()">&larr; Back to Dashboard</span>
        </div>
        <h3 id="sensorTitle" class="fw-bold mb-4 text-secondary"></h3>
        <canvas id="sensorChart" class="mb-5 shadow-sm"></canvas>
        <div class="table-responsive">
            <table class="table table-bordered table-hover bg-white shadow-sm">
                <thead class="table-warning">
                    <tr id="tableHeader"></tr>
                </thead>
                <tbody id="tableBody"></tbody>
            </table>
        </div>
    </div>

    <script>
        const data = {
            light: @json($lightSensors),
            sound: @json($soundSensors),
            humidity: @json($humidityTemperatureSensors),
            air: @json($airQualitySensors),
        };

        const formatDate = (dateString) => {
            const date = new Date(dateString);
            return `${date.getMonth() + 1}/${date.getDate()}/${date.getFullYear()} ${date.getHours() > 12 ? date.getHours() - 12 : date.getHours()}:${date.getMinutes()} ${date.getHours() >= 12 ? 'PM' : 'AM'}`;
        };

        // Main graph that combines all sensor data
        const showMainGraph = () => {
            const records = {
                light: data.light,
                sound: data.sound,
                humidity: data.humidity,
                air: data.air,
            };

            const combinedLabels = [];
            const lightData = [];
            const soundData = [];
            const humidityData = [];
            const airData = [];

            // Collect data for combined graph
            for (const type in records) {
                records[type].forEach(record => {
                    const formattedTime = formatDate(record.created_at);
                    if (!combinedLabels.includes(formattedTime)) {
                        combinedLabels.push(formattedTime);
                    }

                    if (type === 'light') {
                        lightData.push(record.light_intensity);
                    } else if (type === 'sound') {
                        soundData.push(record.value);
                    } else if (type === 'humidity') {
                        humidityData.push(record.humidity);
                    } else if (type === 'air') {
                        airData.push(record.co2);
                    }
                });
            }

            const ctx = document.getElementById('mainChart').getContext('2d');

            if (window.mainChartInstance) window.mainChartInstance.destroy();

            const chartData = {
                labels: combinedLabels,
                datasets: [
                    {
                        label: 'Light Intensity (Lux)',
                        data: lightData,
                        backgroundColor: 'rgba(255, 182, 193, 0.4)',
                        borderColor: 'rgba(255, 105, 180, 1)',
                        borderWidth: 2,
                        fill: true,
                    },
                    {
                        label: 'Sound Level (dB)',
                        data: soundData,
                        backgroundColor: 'rgba(173, 216, 230, 0.4)',
                        borderColor: 'rgba(100, 149, 237, 1)',
                        borderWidth: 2,
                        fill: true,
                    },
                    {
                        label: 'Humidity (%)',
                        data: humidityData,
                        backgroundColor: 'rgba(144, 238, 144, 0.4)',
                        borderColor: 'rgba(34, 139, 34, 1)',
                        borderWidth: 2,
                        fill: true,
                    },
                    {
                        label: 'CO₂ (ppm)',
                        data: airData,
                        backgroundColor: 'rgba(255, 228, 196, 0.4)',
                        borderColor: 'rgba(255, 140, 0, 1)',
                        borderWidth: 2,
                        fill: true,
                    }
                ]
            };

            window.mainChartInstance = new Chart(ctx, {
                type: 'line',
                data: chartData,
                options: {
                    responsive: true,
                    plugins: {
                        legend: { labels: { color: '#555' } }
                    },
                    scales: {
                        y: { beginAtZero: true, ticks: { color: '#666' } },
                        x: { ticks: { color: '#666' } }
                    }
                }
            });
        };

        // Show specific sensor data
        const showSensor = (type) => {
            const section = document.getElementById('sensorDetails');
            section.classList.remove('d-none');

            const titleMap = {
                light: '🌞 Light Sensor',
                sound: '🔊 Sound Sensor',
                humidity: '💧 Humidity & Temperature Sensor',
                air: '🍃 Air Quality Sensor'
            };

            const unitMap = {
                light: 'Units: Lux',
                sound: 'Units: dB (Decibels)',
                humidity: 'Units: Humidity (%), Temperature (°C)',
                air: 'Units: CO₂ (ppm)'
            };

            document.getElementById('sensorTitle').textContent = `${titleMap[type]} - ${unitMap[type]}`;
            const records = data[type];

            const headers = {
                light: ['Light Intensity', 'Status', 'Time'],
                sound: ['Sound Level', 'Status', 'Time'],
                humidity: ['Humidity', 'Temperature', 'Status', 'Time'],
                air: ['CO2 (ppm)', 'Status', 'Time'],
            };

            const tableHeader = document.getElementById('tableHeader');
            tableHeader.innerHTML = headers[type].map(h => `<th>${h}</th>`).join('');

            const tableBody = document.getElementById('tableBody');
            tableBody.innerHTML = records.map(row => {
                const formattedTime = formatDate(row.created_at);
                if (type === 'light') {
                    return `<tr><td>${row.light_intensity}</td><td>${row.status ? 'Active' : 'Inactive'}</td><td>${formattedTime}</td></tr>`;
                } else if (type === 'sound') {
                    return `<tr><td>${row.value}</td><td>${row.status ? 'Active' : 'Inactive'}</td><td>${formattedTime}</td></tr>`;
                } else if (type === 'humidity') {
                    return `<tr><td>${row.humidity}</td><td>${row.temperature}</td><td>${row.status ? 'Active' : 'Inactive'}</td><td>${formattedTime}</td></tr>`;
                } else {
                    return `<tr><td>${row.co2}</td><td>${row.status ? 'Active' : 'Inactive'}</td><td>${formattedTime}</td></tr>`;
                }
            }).join('');

            const ctx = document.getElementById('sensorChart').getContext('2d');
            if (window.sensorChartInstance) window.sensorChartInstance.destroy();

            const chartData = {
                labels: records.map(r => formatDate(r.created_at)),
                datasets: [{
                    label: headers[type][0],
                    data: records.map(r => {
                        if (type === 'light') return r.light_intensity;
                        if (type === 'sound') return r.value;
                        if (type === 'humidity') return r.humidity;
                        if (type === 'air') return r.co2;
                    }),
                    backgroundColor: 'rgba(255, 182, 193, 0.4)',
                    borderColor: 'rgba(255, 105, 180, 1)',
                    borderWidth: 2,
                    fill: true,
                    tension: 0.4,
                    pointBackgroundColor: 'white'
                }]
            };

            window.sensorChartInstance = new Chart(ctx, {
                type: 'line',
                data: chartData,
                options: {
                    responsive: true,
                    plugins: {
                        legend: { labels: { color: '#555' } }
                    },
                    scales: {
                        y: { beginAtZero: true, ticks: { color: '#666' } },
                        x: { ticks: { color: '#666' } }
                    }
                }
            });
        };

        const hideSensor = () => {
            document.getElementById('sensorDetails').classList.add('d-none');
        };

        // Initial combined graph rendering
        showMainGraph();

        // Refresh Data Automatically every 5 seconds
        setInterval(() => {
            fetch('/api/sensors')  // Make sure this route is set up in your API
                .then(response => response.json())
                .then(freshData => {
                    // Update the data
                    data.light = freshData.light;
                    data.sound = freshData.sound;
                    data.humidity = freshData.humidity;
                    data.air = freshData.air;
                    // Update the main graph
                    showMainGraph();
                });
        }, 5000); // 5 seconds
    </script>

</body>
</html>
