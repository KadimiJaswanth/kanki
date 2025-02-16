import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Athlete Performance Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          bodyMedium: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500),
        ),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          bodyMedium: TextStyle(color: Colors.white70, fontWeight: FontWeight.w500),
        ),
      ),
      themeMode: ThemeMode.system,
      home: PerformanceScreen(),
    );
  }
}

class PerformanceScreen extends StatefulWidget {
  @override
  _PerformanceScreenState createState() => _PerformanceScreenState();
}

class _PerformanceScreenState extends State<PerformanceScreen> {
  // Mock data for performance metrics
  List<Map<String, dynamic>> performanceMetrics = [
    {'title': 'Endurance', 'value': 85.0, 'color': Colors.green},
    {'title': 'Strength', 'value': 72.0, 'color': Colors.orange},
    {'title': 'Flexibility', 'value': 90.0, 'color': Colors.blue},
    {'title': 'Speed', 'value': 95.0, 'color': Colors.red},
    {'title': 'Recovery Rate', 'value': 78.0, 'color': Colors.purple},
  ];

  // Default color for the new metric
  Color _currentColor = Colors.blue;

  // Function to add a new performance metric
  void _addPerformanceMetric(String title, double value, Color color) {
    setState(() {
      performanceMetrics.add({'title': title, 'value': value, 'color': color});
    });
  }

  // Function to show the color picker dialog
  void _showColorPickerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Pick a color"),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _currentColor,
              onColorChanged: (Color color) {
                setState(() {
                  _currentColor = color;
                });
              },
              showLabel: false, // Disable the label (RGB values)
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Pick Color"),
            ),
          ],
        );
      },
    );
  }

  // Function to show the Add Metric Dialog
  void _showAddMetricDialog(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController valueController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Metric'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Metric Title'),
              ),
              TextField(
                controller: valueController,
                decoration: InputDecoration(labelText: 'Metric Value'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _showColorPickerDialog(context),
                child: Text("Pick Color"),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final double value = double.tryParse(valueController.text) ?? 0.0;
                _addPerformanceMetric(titleController.text, value, _currentColor);
                Navigator.of(context).pop();
              },
              child: Text('Add Metric'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Athlete Performance Tracker'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildProfileSection(),
              SizedBox(height: 20),
              _buildPerformanceMetrics(),
              SizedBox(height: 20),
              _buildTrainingInsights(),
              SizedBox(height: 20),
              _buildPerformanceGraph(),
              SizedBox(height: 20),
              _buildNotesSection(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddMetricDialog(context),
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add),
      ),
    );
  }

  // Profile section
  Widget _buildProfileSection() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue[100] ?? Colors.blue,
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8.0)],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: Text(
              'Athlete Name: John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 8),
          Center(
            child: Text(
              'Age: 25 | Gender: Male | Sport: Soccer',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }

  // Performance Metrics section with dynamic data
  Widget _buildPerformanceMetrics() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue[50] ?? Colors.blue.shade50,
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8.0)],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Key Performance Metrics',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 10),
          // Display the performance metrics using a card-style layout
          ...performanceMetrics.map((metric) {
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: metric['color'].withOpacity(0.1),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Icon(
                    Icons.fitness_center, // You can customize the icon based on the metric type
                    color: metric['color'],
                    size: 30,
                  ),
                ),
                title: Text(
                  metric['title'],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        '${metric['value']}%',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: metric['color'],
                        ),
                      ),
                    ),
                    CircularPercentIndicator(
                      radius: 40.0,
                      lineWidth: 6.0,
                      percent: metric['value'] / 100,
                      center: Text(
                        '${metric['value'].toStringAsFixed(0)}%',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: metric['color'],
                        ),
                      ),
                      progressColor: metric['color'],
                      backgroundColor: Colors.grey[300] ?? Colors.grey,
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  // Training Insights section
  Widget _buildTrainingInsights() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue[200] ?? Colors.blue.shade200,
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8.0)],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Training Insights',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 10),
          Text(
            'The athlete has shown consistent improvement in strength and flexibility over the last 3 months. Focus should be given to increasing speed and endurance through interval training.',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  // Performance graph (LineChart)
  Widget _buildPerformanceGraph() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue[50] ?? Colors.blue.shade50,
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8.0)],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Performance Trend (Last 6 Weeks)',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 10),
          Container(
            height: 250,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: true),
                borderData: FlBorderData(show: true, border: Border.all(color: Colors.white)),
                minX: 0,
                maxX: 6,
                minY: 0,
                maxY: 100,
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 20),
                      FlSpot(1, 30),
                      FlSpot(2, 40),
                      FlSpot(3, 60),
                      FlSpot(4, 50),
                      FlSpot(5, 80),
                      FlSpot(6, 90),
                    ],
                    isCurved: true,
                    color: Colors.blue,
                    barWidth: 4,
                    belowBarData: BarAreaData(show: true, color: Colors.blue.withOpacity(0.3)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Notes section
  Widget _buildNotesSection() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue[100] ?? Colors.blue.shade100,
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8.0)],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Notes',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 10),
          Text(
            'The athlete is advised to focus on recovery and hydration following intense training sessions. A review of their diet is recommended to ensure optimal performance.',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
