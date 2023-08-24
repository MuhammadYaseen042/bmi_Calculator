import 'package:flutter/material.dart';
import 'input_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable.dart';
import 'icon_content.dart';
import 'result_page.dart';
import 'bottom_button.dart';
import 'round_button.dart';
import 'calculator_bmi.dart';

void main() => runApp(const BMIcalculator());

const activecardcolor = Color(0xFF1D1E33);
const inactivecardcolor = Color(0xFF111328);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color malecardcolor = inactivecardcolor;
  Color femalecardcolor = inactivecardcolor;

  Gender selectedgender = Gender.male;
  int height = 180;
  int weight = 30;
  int age = 15;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        title: const Center(
          child: Text('BMI Calculator'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reusable(
                    onPress: () {
                      setState(() {
                        selectedgender = Gender.male;
                      });
                    },
                    colour: selectedgender == Gender.male
                        ? activecardcolor
                        : inactivecardcolor,
                    cardchild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: Reusable(
                    onPress: () {
                      setState(() {
                        selectedgender = Gender.female;
                      });
                    },
                    colour: selectedgender == Gender.female
                        ? activecardcolor
                        : inactivecardcolor,
                    cardchild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Reusable(
              onPress: () {},
              colour: Color(0xFF1D1E33),
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Height',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'cm',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderThumbShape(enabledThumbRadius: 20.0),
                      overlayColor: Colors.white,
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      activeColor: Colors.blueAccent,
                      inactiveColor: Colors.white,
                      onChanged: (double newvalue) {
                        setState(() {
                          height = newvalue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Reusable(
                    onPress: () {},
                    colour: const Color(0xFF1D1E33),
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Reusable(
                          onPress: () {},
                          colour: const Color(0xFF1D1E33),
                          cardchild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Age',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                age.toString(),
                                style: TextStyle(
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPress: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPress: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          BottomButton(
              ontap: () {
                CalculatorBMI calc =
                    CalculatorBMI(weight: weight, height: height);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultPage(
                        bmiresult: calc.calculateBMI(),
                        resulttext: calc.getResult(),
                        resultinterpretation: calc.getInterpretation(),
                      );
                    },
                  ),
                );
              },
              Btitle: 'Calulate')
        ],
      ),
    );
  }
}
