import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class FuelVsEVComparisonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark theme background
      appBar: AppBar(
        title: Text('Fuel vs Electric Vehicle', style: TextStyle(color: Colors.cyanAccent, fontWeight: FontWeight.bold, shadows: [Shadow(color: Colors.cyan, blurRadius: 10)])),
        backgroundColor: Colors.cyan[900],
        elevation: 5,
        shadowColor: Colors.cyanAccent.withOpacity(0.6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Comparison: Fuel vs Electric Vehicles',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.cyanAccent, shadows: [Shadow(color: Colors.cyan, blurRadius: 8)]),
            ),
            SizedBox(height: 10),

            Table(
              border: TableBorder.all(color: Colors.cyanAccent.withOpacity(0.7), width: 1.5),
              columnWidths: {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1),
              },
              children: [
                _buildTableRow('Factor', 'Fuel Vehicle', 'EV', isHeader: true),
                _buildTableRow('Cost/km', '₹9/km', '₹1.5/km'),
                _buildTableRow('Mileage', '12 km/l', '8 km/kWh'),
                _buildTableRow('CO₂ Emission', '140 g/km', '0 g/km'),
                _buildTableRow('Maintenance', '₹10,000/yr', '₹2,500/yr'),
                _buildTableRow('Refuel/Charge', '5 min', '25 min'),
              ],
            ),

            SizedBox(height: 20),
            Text(
              'Graphical Comparison',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.cyanAccent, shadows: [Shadow(color: Colors.cyan, blurRadius: 8)]),
            ),
            SizedBox(height: 10),

            Row(
              children: [
                _buildLegendBox(Colors.redAccent, "Fuel Vehicle"),
                SizedBox(width: 10),
                _buildLegendBox(Colors.greenAccent, "Electric Vehicle"),
              ],
            ),

            SizedBox(height: 10),

            Expanded(
              child: BarChart(
                BarChartData(
                  barGroups: _getChartData(),
                  backgroundColor: Colors.grey[850],
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1000,
                        getTitlesWidget: (value, meta) {
                          return Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Text(
                              value.toInt().toString(),
                              style: TextStyle(fontSize: 12, color: Colors.cyanAccent),
                            ),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          List<String> labels = ['Cost', 'Mileage', 'CO₂', 'Maint.', 'Time'];
                          return Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text(
                              labels[value.toInt()],
                              style: TextStyle(fontSize: 12, color: Colors.cyanAccent),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barTouchData: BarTouchData(enabled: true),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(String factor, String fuel, String ev, {bool isHeader = false}) {
    return TableRow(
      decoration: BoxDecoration(color: isHeader ? Colors.blueGrey[900] : Colors.black),
      children: [
        _buildTableCell(factor, isHeader: isHeader),
        _buildTableCell(fuel, isHeader: isHeader),
        _buildTableCell(ev, isHeader: isHeader),
      ],
    );
  }

  Widget _buildTableCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          color: Colors.cyanAccent,
        ),
      ),
    );
  }

  List<BarChartGroupData> _getChartData() {
    List<double> fuelData = [900, 1200, 14000, 10000, 5];
    List<double> evData = [150, 800, 0, 2500, 25];

    return List.generate(5, (index) => BarChartGroupData(
          x: index,
          barRods: [
            BarChartRodData(
              toY: fuelData[index] / 10,
              color: Colors.redAccent.withOpacity(0.8),
              width: 14,
              borderRadius: BorderRadius.circular(4),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: fuelData[index] / 8,
                color: Colors.red.withOpacity(0.2),
              ),
            ),
            BarChartRodData(
              toY: evData[index] / 10,
              color: Colors.greenAccent.withOpacity(0.8),
              width: 14,
              borderRadius: BorderRadius.circular(4),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: evData[index] / 8,
                color: Colors.green.withOpacity(0.2),
              ),
            ),
          ],
        ));
  }

  Widget _buildLegendBox(Color color, String text) {
    return Row(
      children: [
        Container(width: 20, height: 20, decoration: BoxDecoration(color: color, boxShadow: [BoxShadow(color: color, blurRadius: 10)])),
        SizedBox(width: 5),
        Text(text, style: TextStyle(fontSize: 14, color: Colors.cyanAccent)),
      ],
    );
  }
}
