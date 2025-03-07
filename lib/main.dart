import 'package:flutter/material.dart';

void main() {
  runApp(ColoredCalculator());
}

class ColoredCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";
  String _input = "";
  double _num1 = 0;
  double _num2 = 0;
  String _operator = "";

  void buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _input = "";
      _output = "0";
      _num1 = 0;
      _num2 = 0;
      _operator = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "*" || buttonText == "/") {
      _num1 = double.parse(_input);
      _operator = buttonText;
      _input = "";
    } else if (buttonText == ".") {
      if (_input.contains(".")) {
        return;
      } else {
        _input = _input + buttonText;
      }
    } else if (buttonText == "=") {
      _num2 = double.parse(_input);

      if (_operator == "+") {
        _output = (_num1 + _num2).toString();
      }
      if (_operator == "-") {
        _output = (_num1 - _num2).toString();
      }
      if (_operator == "*") {
        _output = (_num1 * _num2).toString();
      }
      if (_operator == "/") {
        _output = (_num1 / _num2).toString();
      }

      _num1 = 0;
      _num2 = 0;
      _operator = "";
      _input = _output;
    } else {
      _input = _input + buttonText;
    }

    setState(() {
      _output = double.parse(_input).toString();
    });
  }

  Widget buildButton(String buttonText, Color buttonColor) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(24.0),
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Colored Calculator'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              _output,
              style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          Expanded(
            child: Divider(color: Colors.grey),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  buildButton("7", Colors.blueAccent),
                  buildButton("8", Colors.blueAccent),
                  buildButton("9", Colors.blueAccent),
                  buildButton("/", Colors.orangeAccent),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("4", Colors.blueAccent),
                  buildButton("5", Colors.blueAccent),
                  buildButton("6", Colors.blueAccent),
                  buildButton("*", Colors.orangeAccent),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("1", Colors.blueAccent),
                  buildButton("2", Colors.blueAccent),
                  buildButton("3", Colors.blueAccent),
                  buildButton("-", Colors.orangeAccent),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton(".", Colors.blueAccent),
                  buildButton("0", Colors.blueAccent),
                  buildButton("00", Colors.blueAccent),
                  buildButton("+", Colors.orangeAccent),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("CLEAR", Colors.redAccent),
                  buildButton("=", Colors.greenAccent),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
