import 'package:bmicalculator/routes/input_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(BmiCalculatorApp());

class BmiCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InputPage(),
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0D21),
        scaffoldBackgroundColor: Color(0xFF0A0D21),
        accentColor: Color(0xFFD83558),
        cardColor: Color(0xFF1D1E33),
        selectedRowColor: Color(0xFFD83558),
      ),
    );
  }
}
