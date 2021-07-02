import 'package:flutter/material.dart';
import 'package:flutter_multiplier/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Multiplier Covid-19',
      home: HomeScreen(),
    );
  }
}
