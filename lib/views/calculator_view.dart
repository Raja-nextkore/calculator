import 'package:calculator/views/button_view.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String userQuestion = '';
  String userAnswer = '';

  final List<String> buttonText = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  bool isOprator(String x) {
    if (x == '%' || x == '/' || x == '*' || x == '-' || x == '+' || x == '=') {
      return true;
    } else {
      return false;
    }
  }

  void equalTapped(){
    String finalQuestion = userQuestion;
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm  = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      userQuestion,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userAnswer,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemCount: buttonText.length,
                itemBuilder: (context, index) {
                  //! Clear Button
                  if (index == 0) {
                    return BuildButtons(
                      onTaped: () {
                        setState(() {
                          userQuestion = '';
                          userAnswer = '';
                        });
                      },
                      color: Colors.green,
                      textColor: Colors.white,
                      buttonText: buttonText[index],
                    );

                  } 
                  //! Delete Button
                  else if (index == 1) {
                    return BuildButtons(
                      onTaped: () {
                        setState(() {
                          if (userQuestion.isNotEmpty) {
                            userQuestion = userQuestion.substring(
                                0, userQuestion.length - 1);
                          } else {
                            setState(() {
                              userQuestion = '';
                            });
                          }
                        });
                      },
                      color: Colors.red,
                      textColor: Colors.white,
                      buttonText: buttonText[index],
                    );
                  } 
                  //! Equeal Button
                  else if(index == buttonText.length-1){
                    return BuildButtons(
                      onTaped: () {
                        setState(() {
                          equalTapped();
                        });
                      },
                      color: Colors.deepPurple,
                      textColor: Colors.white,
                      buttonText: buttonText[index],
                    );
                  }
                  //! Answer Button
                  else if(index == buttonText.length-2){
                    return BuildButtons(
                      onTaped: () {
                        setState(() {
                          equalTapped();
                        });
                      },
                      color: Colors.deepPurple,
                      textColor: Colors.white,
                      buttonText: buttonText[index],
                    );
                  }
                  //! Rest of the Button
                  else {
                    return BuildButtons(
                      onTaped: () {
                        setState(() {
                          userQuestion += buttonText[index];
                        });
                      },
                      color: (isOprator(buttonText[index]))
                          ? Colors.deepPurple
                          : Colors.deepPurple[50],
                      textColor: (isOprator(buttonText[index]))
                          ? Colors.white
                          : Colors.deepPurple,
                      buttonText: buttonText[index],
                    );
                  }
                },
              ),
            ),
          ),
        ],
      )),
    );
  }
}
