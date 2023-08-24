import 'package:flutter/material.dart';
import 'main.dart';

class BMIcalculator extends StatelessWidget {
  const BMIcalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green[400],
        appBarTheme: AppBarTheme(
          color: Colors.black12,
        ),
      ),
      home: InputPage(),
    );
  }
}
