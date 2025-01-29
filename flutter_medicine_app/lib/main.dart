import 'package:flutter/material.dart';
import 'package:flutter_medicine_app/data/service/date.dart';
import 'package:flutter_medicine_app/presentation/ui/medication_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  String _dateTime = '';

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  String _getDateTime() {
    final now = DateTime.now().toString().toDBModelData();
    return now;
  }

  void _setDateTime() {
    setState(() {
      _dateTime = _getDateTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),
      body: Center(
        child: Column(
          children: [Expanded(child: MedicationScreen())],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _setDateTime,
        tooltip: 'Increment',
        child: const Icon(Icons.calendar_today),
      ),
    );
  }
}
