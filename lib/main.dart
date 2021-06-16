import 'package:calculator/widgets/calculator_display_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';

double userInputFontSize = 50.0;
double calculatedDataFontSize = 35.0;

Color userInputColor = Color(0xFFFFFFFF);
Color answerColor = Color(0xFF9397a3);

String userInput = '0';
String calculatedData = '';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Color(0xFF08121c),
    ),
  );
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  calculation(buttonText) {
    setState(() {
      if (buttonText == 'C') {
        userInputColor = Color(0xFFFFFFFF);
        answerColor = Color(0xFF9397a3);
        calculatedDataFontSize = 35.0;
        userInputFontSize = 50.0;
        userInput = '0';
        calculatedData = '';
      } else if (buttonText == 'AC') {
        userInputColor = Color(0xFFFFFFFF);
        answerColor = Color(0xFF9397a3);
        calculatedDataFontSize = 35.0;
        userInputFontSize = 50.0;
        userInput = userInput.substring(0, userInput.length - 1);
        if (userInput == '') {
          userInput = '0';
        }
      } else if (buttonText == '=') {
        userInputColor = Color(0xFF9397a3);
        answerColor = Colors.white;
        try {
          calculatedDataFontSize = 50.0;
          userInputFontSize = 30.0;

          String finalInput = userInput.replaceAll('x', '*');
          Parser p = Parser();
          Expression exp = p.parse(finalInput);
          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);
          calculatedData = eval.toString();
        } catch (e) {
          calculatedData = 'Error';
        }
      } else {
        if (userInput == '0') {
          userInput = buttonText;
        } else {
          userInput = userInput + buttonText;
        }
      }
    });
  }

  Widget button({buttonHeight, color, buttonText}) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3.5),
        border: Border.all(
          color: Color(0xFF000000),
        ),
      ),
      child: TextButton(
        onPressed: () => calculation(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF08121c),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          DisplayData(
            color: answerColor,
            fontSize: calculatedDataFontSize,
            text: calculatedData,
          ),
          DisplayData(
            fontSize: userInputFontSize,
            color: userInputColor,
            text: userInput,
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        button(
                          color: Color(0xFF143441),
                          buttonText: 'C',
                          buttonHeight: 1,
                        ),
                        button(
                          color: Color(0xFF143441),
                          buttonText: 'AC',
                          buttonHeight: 1,
                        ),
                        button(
                          color: Color(0xFF143441),
                          buttonText: '%',
                          buttonHeight: 1,
                        ),
                        button(
                          color: Color(0xFF143441),
                          buttonText: '/',
                          buttonHeight: 1,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        button(
                          color: Color(0xFF42505d),
                          buttonText: '7',
                          buttonHeight: 1,
                        ),
                        button(
                          color: Color(0xFF42505d),
                          buttonText: '8',
                          buttonHeight: 1,
                        ),
                        button(
                          color: Color(0xFF42505d),
                          buttonText: '9',
                          buttonHeight: 1,
                        ),
                        button(
                          color: Color(0xFF143441),
                          buttonText: 'x',
                          buttonHeight: 1,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        button(
                          color: Color(0xFF42505d),
                          buttonText: '4',
                          buttonHeight: 1,
                        ),
                        button(
                          color: Color(0xFF42505d),
                          buttonText: '5',
                          buttonHeight: 1,
                        ),
                        button(
                          color: Color(0xFF42505d),
                          buttonText: '6',
                          buttonHeight: 1,
                        ),
                        button(
                          color: Color(0xFF143441),
                          buttonText: '-',
                          buttonHeight: 1,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        button(
                          color: Color(0xFF42505d),
                          buttonText: '1',
                          buttonHeight: 1,
                        ),
                        button(
                          color: Color(0xFF42505d),
                          buttonText: '2',
                          buttonHeight: 1,
                        ),
                        button(
                          color: Color(0xFF42505d),
                          buttonText: '3',
                          buttonHeight: 1,
                        ),
                        button(
                          color: Color(0xFF143441),
                          buttonText: '+',
                          buttonHeight: 1,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        button(
                          color: Color(0xFF42505d),
                          buttonText: '0',
                          buttonHeight: 1,
                        ),
                        button(
                          color: Color(0xFF42505d),
                          buttonText: '00',
                          buttonHeight: 1,
                        ),
                        button(
                          color: Color(0xFF42505d),
                          buttonText: '.',
                          buttonHeight: 1,
                        ),
                        button(
                          color: Color(0xFFec7320),
                          buttonText: '=',
                          buttonHeight: 1,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
