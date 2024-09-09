import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';

// apa saja
class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  CalculatorScreenState createState() => CalculatorScreenState();
}

class CalculatorScreenState extends State<CalculatorScreen> {
  double _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculator',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      backgroundColor: Color.fromARGB(255, 188, 212, 123),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 50.0), // Adjust the top padding as needed
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.6,
              child: SimpleCalculator(
                value: _currentValue,
                hideExpression: false,
                hideSurroundingBorder: true,
                autofocus: true,
                onChanged: (key, value, expression) {
                  setState(() {
                    _currentValue = value ?? 0;
                  });
                  if (kDebugMode) {
                    print('$key\t$value\t$expression');
                  }
                },
                onTappedDisplay: (value, details) {
                  if (kDebugMode) {
                    print('$value\t${details.globalPosition}');
                  }
                },
                theme: const CalculatorThemeData(
                  displayColor: Color.fromARGB(255, 61, 61, 61),
                  displayStyle: TextStyle(
                    fontSize: 80,
                    color: Color.fromARGB(255, 248, 248, 248),
                  ),
                  expressionColor: Colors.indigo,
                  expressionStyle: TextStyle(fontSize: 20, color: Colors.white),
                  operatorColor: Colors.pink,
                  operatorStyle: TextStyle(fontSize: 30, color: Colors.white),
                  commandColor: Colors.orange,
                  commandStyle: TextStyle(fontSize: 30, color: Colors.white),
                  numColor: Colors.grey,
                  numStyle: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
