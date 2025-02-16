import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:fl_chart/fl_chart.dart';

class HealthScreen extends StatefulWidget {
  @override
  _HealthScreenState createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  double weight = 70.0;
  double height = 1.75;
  int heartRate = 72;
  double hydration = 2.5;
  int caloriesBurned = 250;
  double distanceTraveled = 5.0;
  double bodyFatPercentage = 18.0;
  int restingHeartRate = 60;
  double bmi = 0.0;
  double sleepHours = 7.5;
  double hydrationProgress = 0.6;
  bool isDarkMode = false;

  // Example data for daily activity (could be replaced with real data)
  List<FlSpot> activityData = [
    FlSpot(0, 2),
    FlSpot(1, 2.5),
    FlSpot(2, 3),
    FlSpot(3, 2.8),
    FlSpot(4, 3.2),
    FlSpot(5, 4),
  ];

  double calculateBMI() {
    return weight / (height * height);
  }

  @override
  Widget build(BuildContext context) {
    bmi = calculateBMI();
    return Scaffold(
      appBar: AppBar(
        title: Text("Health Monitoring"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: isDarkMode ? Colors.black : Color(0xFF1E88E5),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.brightness_7 : Icons.brightness_4),
            onPressed: () {
              setState(() {
                isDarkMode = !isDarkMode;
              });
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              neumorphicSection("Physical Health Status", isDarkMode),
              SizedBox(height: 20),
              buildNeumorphicCard("Weight", "$weight kg", Icons.fitness_center),
              buildNeumorphicCard("Height", "$height m", Icons.height),
              buildNeumorphicCard("Heart Rate", "$heartRate bpm", Icons.favorite),
              buildNeumorphicCard("Hydration", "${hydration.toStringAsFixed(1)} liters", Icons.water_drop),
              buildNeumorphicCard("Calories Burned", "$caloriesBurned kcal", Icons.local_fire_department),
              buildNeumorphicCard("Distance Traveled", "$distanceTraveled km", Icons.directions_run),
              buildNeumorphicCard("Body Fat Percentage", "${bodyFatPercentage}%", Icons.accessibility),
              buildNeumorphicCard("Resting Heart Rate", "$restingHeartRate bpm", Icons.access_alarm),
              SizedBox(height: 20),
              neumorphicSection("Sleep & Recovery", isDarkMode),
              buildNeumorphicCard("Sleep Hours", "$sleepHours hours", Icons.bed),
              SizedBox(height: 20),
              neumorphicCardWithAnimation("BMI: ${bmi.toStringAsFixed(2)}", Icons.favorite),
              SizedBox(height: 20),
              buildHydrationProgress(isDarkMode),
              SizedBox(height: 20),
              buildFitnessGoals(isDarkMode),
              SizedBox(height: 20),
              buildMotivationalQuote(isDarkMode),
              SizedBox(height: 20),
              buildActivityChart(isDarkMode),
            ],
          ),
        ),
      ),
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
    );
  }

  // Neumorphism styled Section with gradient background
  Widget neumorphicSection(String title, bool isDarkMode) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [isDarkMode ? Colors.grey[800]! : Color(0xFFE1F5FE), Colors.blue.shade100],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isDarkMode ? Colors.black26 : Colors.grey[300]!,
            blurRadius: 15,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  // Neumorphic cards for each health stat
  Widget buildNeumorphicCard(String title, String value, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[850] : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isDarkMode ? Colors.black26 : Colors.grey[300]!,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: isDarkMode ? Colors.white : Color(0xFF1E88E5), size: 30),
          SizedBox(width: 20),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? Colors.white : Color(0xFF1E88E5),
            ),
          ),
        ],
      ),
    );
  }

  // Animated BMI display with neumorphism
  Widget neumorphicCardWithAnimation(String bmiText, IconData icon) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[850] : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isDarkMode ? Colors.black26 : Colors.grey[300]!,
            blurRadius: 15,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: isDarkMode ? Colors.white : Color(0xFF1E88E5), size: 30),
          SizedBox(width: 20),
          Expanded(
            child: Text(
              bmiText,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Color(0xFF1E88E5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Hydration Progress with neumorphism and circular indicator
  Widget buildHydrationProgress(bool isDarkMode) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[850] : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isDarkMode ? Colors.black26 : Colors.grey[300]!,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hydration Progress",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Color(0xFF1E88E5),
            ),
          ),
          SizedBox(height: 10),
          CircularProgressIndicator(
            value: hydrationProgress,
            strokeWidth: 10,
            backgroundColor: isDarkMode ? Colors.grey[700]! : Colors.grey[300]!,
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1E88E5)),
          ),
          SizedBox(height: 10),
          Text(
            "${(hydrationProgress * 100).toStringAsFixed(0)}% of your hydration goal",
            style: TextStyle(fontSize: 14, color: isDarkMode ? Colors.white : Colors.grey),
          ),
        ],
      ),
    );
  }

  // Fitness Goals with neumorphism
  Widget buildFitnessGoals(bool isDarkMode) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[850] : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isDarkMode ? Colors.black26 : Colors.grey[300]!,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Fitness Goals",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Color(0xFF1E88E5),
            ),
          ),
          SizedBox(height: 20),
          buildGoalProgress("Weight Loss Goal", "Target: 65 kg", 0.6),
          buildGoalProgress("Running Distance", "Target: 10 km", 0.4),
        ],
      ),
    );
  }

  // Helper method to create progress bars for goals
  Widget buildGoalProgress(String goalTitle, String goalDescription, double progress) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(goalTitle, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: isDarkMode ? Colors.white : Colors.black)),
          Text(goalDescription, style: TextStyle(fontSize: 12, color: isDarkMode ? Colors.white70 : Colors.grey)),
          SizedBox(height: 10),
          LinearProgressIndicator(
            value: progress,
            color: Color(0xFFFF7043),
            backgroundColor: isDarkMode ? Colors.grey[700]! : Colors.grey[300]!,
            minHeight: 8,
          ),
          SizedBox(height: 5),
          Text("${(progress * 100).toStringAsFixed(0)}% Achieved", style: TextStyle(fontSize: 12, color: isDarkMode ? Colors.white : Colors.black)),
        ],
      ),
    );
  }

  // Motivational Quote Section
  Widget buildMotivationalQuote(bool isDarkMode) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[850] : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isDarkMode ? Colors.black26 : Colors.grey[300]!,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "\"The only way to do great work is to love what you do.\"",
            style: TextStyle(
              fontSize: 18,
              fontStyle: FontStyle.italic,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "- Steve Jobs",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.grey),
          ),
        ],
      ),
    );
  }

  // Activity Chart (Fixed with proper sizing)
  Widget buildActivityChart(bool isDarkMode) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[850] : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isDarkMode ? Colors.black26 : Colors.grey[300]!,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Daily Activity (Distance Traveled)",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Color(0xFF1E88E5),
            ),
          ),
          SizedBox(height: 10),
          // Wrap the LineChart with a SizedBox to give it a fixed height
          SizedBox(
            height: 250,  // Set a fixed height for the chart
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: true),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: 6,
                minY: 0,
                maxY: 5,
                lineBarsData: [
                  LineChartBarData(
                    spots: activityData,
                    isCurved: true,
                    color: Color(0xFF1E88E5),
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
