import 'package:flutter/material.dart';

class CounterDemo extends StatefulWidget {
  Color buttonColor;
  CounterDemo({super.key, required this.buttonColor});

  @override
  State<CounterDemo> createState() => _CounterDemoState();
}

class _CounterDemoState extends State<CounterDemo> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: widget.buttonColor,
        onPressed: increment,
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: Center(child: Text("$counter", style: TextStyle(fontSize: 30))),
    );
  }
}
