import 'package:flutter/material.dart';
import 'package:session03_calculator/calculator_screen.dart';

void main() {
runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "CalculatorScreen",
    routes: {
      CalculatorScreen.routeName : (context) => CalculatorScreen(),
    },
  );
  }
}