import 'package:flutter/material.dart';
import 'package:flutter_gpt_app/calculator_page.dart';
import 'package:flutter_gpt_app/components/droping_down.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CalculatorPage());
  }
}
