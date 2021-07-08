import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeApp(),
    ));

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  String output = "0";
  String history = "";

  String _out = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String btnVal) {
    print(btnVal);
    if (btnVal == "AC") {
      _out = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (btnVal == "π") {
      const double pi = 3.1415926535897932;
      _out = pi.toString();
    } else if (btnVal == "ln2") {
      const double ln2 = 0.6931471805599453;
      _out = ln2.toString();
    } else if (btnVal == "ln10") {
      const double ln10 = 2.302585092994046;
      _out = ln10.toString();
    } else if (btnVal == "e") {
      const double e = 2.718281828459045;
      _out = e.toString();
    } else if (btnVal == "+" ||
        btnVal == "-" ||
        btnVal == "*" ||
        btnVal == "/" ||
        btnVal == "Sin" ||
        btnVal == "cos" ||
        btnVal == "tan" ||
        btnVal == "√" ||
        btnVal == "asin" ||
        btnVal == "atan" ||
        btnVal == "log" ||
        btnVal == "^" ||
        btnVal == "acos" ||
        btnVal == "x2") {
      num1 = double.parse(output);
      operand = btnVal;
      _out = "0";
      output = output + btnVal;
    } else if (btnVal == ".") {
      if (_out.contains(".")) {
        print("Already exist");
        return;
      } else {
        _out = _out + btnVal;
      }
    } else if (btnVal == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _out = (num2 + num1).toString();
      }

      if (operand == "cos") {
        num1 = 0;
        _out = (cos(num2)).toString();
      }
      if (operand == "^") {
        _out = (pow(num1, num2)).toString();
      }
      if (operand == "tan") {
        num1 = 0;
        _out = (tan(num2)).toString();
      }
      if (operand == "asin") {
        num1 = 0;
        _out = (asin(num2)).toString();
      }
      if (operand == "atan") {
        num1 = 0;
        _out = (atan(num2)).toString();
      }
      if (operand == "acos") {
        num1 = 0;
        _out = (acos(num2)).toString();
      }

      if (operand == "Sin") {
        num1 = 0;
        _out = (sin(num2)).toString();
      }
      if (operand == "log") {
        num1 = 0;
        _out = (log(num2)).toString();
      }
      if (operand == "-") {
        _out = (num1 - num2).toString();
      }

      if (operand == "*") {
        _out = (num2 * num1).toString();
      }
      if (operand == "/") {
        _out = (num1 / num2).toString();
      }
      if (operand == "√") {
        num1 = 0;
        _out = sqrt(num2).toString();
      }
      if (operand == "x2") {
        _out = (exp(num2)).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      //_out = "0";
    } else {
      if (operand == "0") {
        operand = btnVal;
      } else {
        _out = _out + btnVal;
      }
    }

    setState(() {
      output = double.parse(_out).toStringAsFixed(1);
    });
  }

  // ignore: non_constant_identifier_names
  Widget buildButton(String ButtonVal) {
    // button design
    return new Expanded(
        child: Container(
      padding: EdgeInsets.all(0.0),
      margin: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        boxShadow: [
          BoxShadow(
              offset: Offset(2.0, 2.0), blurRadius: 8.0, spreadRadius: 1.0),
          BoxShadow(
              color: Colors.black,
              offset: Offset(-2.0, -2.0),
              blurRadius: 3.0,
              spreadRadius: 1.0),
        ],
      ),
      child: MaterialButton(
        padding: EdgeInsets.all(10.0),
        child: Text(
          ButtonVal,
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
        onPressed: () => buttonPressed(ButtonVal),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[300],
          body: Container(
            color: Colors.black,
            child: Column(
              children: <Widget>[
                Container(
                    alignment: Alignment.centerRight,
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
                    child: Text(
                      output,
                      style: TextStyle(fontSize: 60.0, color: Colors.yellow),
                    )),
                Expanded(
                  child: Divider(
                    color: Colors.yellow,
                  ),
                ),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        buildButton("log"),
                        buildButton("^"),
                        buildButton("π"),
                        buildButton("ln2"),
                        buildButton("ln10"),
                        buildButton("e")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("cos"),
                        buildButton("Sin"),
                        buildButton("tan"),
                        buildButton("acos"),
                        buildButton("asin"),
                        buildButton("atan")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("."),
                        buildButton("AC"),
                        buildButton("√"),
                        buildButton("*")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("7"),
                        buildButton("8"),
                        buildButton("9"),
                        buildButton("/")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("4"),
                        buildButton("5"),
                        buildButton("6"),
                        buildButton("+")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("1"),
                        buildButton("2"),
                        buildButton("3"),
                        buildButton("-")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("0"),
                        buildButton("00"),
                        buildButton("="),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
