import 'package:flutter/material.dart';

class PerformanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Performance Screen"),
      ),
      body: Center(
        child: Text(
          'Performance Content',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
