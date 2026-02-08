import 'package:flutter/material.dart';

class CounterDemo extends StatefulWidget {
  final Color buttonColor;
  const CounterDemo({super.key, required this.buttonColor});

  @override
  State<CounterDemo> createState() => _CounterDemoState();
}

class _CounterDemoState extends State<CounterDemo> {
  int counter = 0;

  void increment() {
    if (mounted) {
      setState(() {
        counter++;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
