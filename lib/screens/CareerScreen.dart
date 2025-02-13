import 'package:flutter/material.dart';

class CareerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Career Screen"),
      ),
      body: Center(
        child: Text(
          'Career Content',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
