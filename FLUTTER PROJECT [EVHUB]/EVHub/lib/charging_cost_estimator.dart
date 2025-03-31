import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChargingCostEstimatorPage extends StatefulWidget {
  @override
  _ChargingCostEstimatorPageState createState() =>
      _ChargingCostEstimatorPageState();
}

class _ChargingCostEstimatorPageState extends State<ChargingCostEstimatorPage> {
  double batteryCapacity = 50.0;
  double costPerKWh = 12.0;
  double chargingPower = 7.0;
  double efficiency = 6.0;
  double chargingCost = 0.0;
  double chargingTime = 0.0;
  double estimatedRange = 0.0;
  List<FlSpot> graphData = [];

  void calculateCost() {
    setState(() {
      chargingCost = batteryCapacity * costPerKWh;
      chargingTime = batteryCapacity / chargingPower;
      estimatedRange = batteryCapacity * efficiency;
      generateGraphData();
    });
  }

  void generateGraphData() {
    graphData = List.generate(
      10,
      (index) {
        double capacity = (index + 1) * 10.0;
        double cost = capacity * costPerKWh;
        return FlSpot(capacity, cost);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Charging Cost Estimator'),
        backgroundColor: Color(0xFF001F00),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSlider('Battery Capacity (kWh)', batteryCapacity, 10.0, 100.0, (value) => batteryCapacity = value),
            buildSlider('Cost per kWh (₹)', costPerKWh, 5.0, 20.0, (value) => costPerKWh = value),
            buildSlider('Charging Power (kW)', chargingPower, 3.0, 50.0, (value) => chargingPower = value),
            buildSlider('Efficiency (km per kWh)', efficiency, 4.0, 10.0, (value) => efficiency = value),
            
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyanAccent,
                  foregroundColor: Colors.black,
                ),
                onPressed: calculateCost,
                child: Text('Calculate'),
              ),
            ),
            SizedBox(height: 20),
            buildResultText('Estimated Charging Cost: ₹${chargingCost.toStringAsFixed(2)}'),
            buildResultText('Estimated Charging Time: ${chargingTime.toStringAsFixed(1)} hours'),
            buildResultText('Estimated Range After Charge: ${estimatedRange.toStringAsFixed(1)} km'),
            SizedBox(height: 20),
            Expanded(
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true, drawVerticalLine: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 200,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) => SideTitleWidget(
                          axisSide: meta.axisSide,
                          space: 5,
                          child: Text(
                            value.toInt().toString(),
                            style: TextStyle(fontSize: 12, color: Colors.greenAccent),
                          ),
                        ),
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 20,
                        reservedSize: 30,
                        getTitlesWidget: (value, meta) => SideTitleWidget(
                          axisSide: meta.axisSide,
                          space: 5,
                          angle: -45,
                          child: Text(
                            value.toInt().toString(),
                            style: TextStyle(fontSize: 12, color: Colors.greenAccent),
                          ),
                        ),
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: true, border: Border.all(color: Colors.greenAccent)),
                  lineBarsData: [
                    LineChartBarData(
                      spots: graphData,
                      isCurved: true,
                      barWidth: 3,
                      belowBarData: BarAreaData(show: true, color: Colors.greenAccent.withOpacity(0.3)),
                      gradient: LinearGradient(colors: [Colors.greenAccent, Colors.cyanAccent]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  Widget buildSlider(String label, double value, double min, double max, Function(double) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ${value.toStringAsFixed(1)}',
          style: TextStyle(color: Colors.greenAccent),
        ),
        Slider(
          value: value,
          min: min,
          max: max,
          divisions: 10,
          label: value.toStringAsFixed(1),
          onChanged: (newValue) => setState(() => onChanged(newValue)),
          activeColor: Colors.cyanAccent,
          inactiveColor: Colors.greenAccent.withOpacity(0.3),
        ),
      ],
    );
  }

  Widget buildResultText(String text) {
    return Text(
      text,
      style: TextStyle(color: Colors.greenAccent, fontSize: 16),
    );
  }
}