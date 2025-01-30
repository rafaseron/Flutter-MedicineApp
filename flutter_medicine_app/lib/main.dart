import 'package:flutter/material.dart';
import 'package:flutter_medicine_app/data/service/date.dart';
import 'package:flutter_medicine_app/presentation/components/custom_navigation_bar.dart';
import 'package:flutter_medicine_app/presentation/ui/add_screen/add_screen.dart';
import 'package:flutter_medicine_app/presentation/ui/history_screen/history_screen.dart';
import 'package:flutter_medicine_app/presentation/ui/medication_screen/medication_screen.dart';

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
        home: MyHomePage(title: "Medication App"));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  String _dateTime = '';

  final List<Widget> _screens = [
    MedicationScreen(),
    const AddScreen(),
    const HistoryScreen(),
  ];

  void _updateIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex, // Passa o índice atual
        onTap: _updateIndex, // Passa o método de atualização
      ),
    );
  }
}
