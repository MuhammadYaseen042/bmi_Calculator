import 'package:bmi_calculator/reusable.dart';
import 'package:flutter/material.dart';
import 'bottom_button.dart';

class ResultPage extends StatelessWidget {
  final String bmiresult;
  final String resulttext;
  final String resultinterpretation;

  ResultPage(
      {required this.bmiresult,
      required this.resulttext,
      required this.resultinterpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        title: Center(
          child: Text('BMI Calculator'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Reusable(
              onPress: () {},
              colour: Color(0xFF1D1E33),
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: Text(
                      resulttext.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      bmiresult,
                      style: TextStyle(
                        fontSize: 100.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      resultinterpretation,
                      style: TextStyle(fontSize: 22.0, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              ontap: () {
                Navigator.pop(context);
              },
              Btitle: 'Re-Calculate')
        ],
      ),
    );
  }
}
