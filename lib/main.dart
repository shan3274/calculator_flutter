import 'package:calculater/cal_buttons.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  List<String> value = <String>[
    "1",
    "2",
    "3",
    "+",
    "4",
    "5",
    "6",
    "-",
    "7",
    "8",
    "9",
    "/",
    "0",
    "*",
    "%",
    ".",
    "clr",
    "="
  ];
  var str = "";

  bool check = false;
  String inputValue = "";
  String sign = "";
  bool dot = false;
  bool called = false;

  void input(String val) {
    setState(() {
      if (called) {
        clear();
        called = false;
      }
      if (val == "+" || val == "-" || val == "/" || val == "%" || val == "*") {
        if (sign == "") {
          sign += val;
          inputValue += val;
        }
      } else if (val == ".") {
        dot = true;
        inputValue += val;
      } else {
        inputValue += val;
      }
    });
  }

  void clear() {
    setState(() {
      inputValue = "";
      sign = "";
      dot = false;
    });
  }

  void equal() {
    setState(() {
      if (!dot) {
        if (sign == "+") {
          var values = inputValue.split("+");
          int one = int.parse(values[0]);
          int two = int.parse(values[1]);
          inputValue = (one + two).toString();
        } else if (sign == "-") {
          var values = inputValue.split("-");
          int one = int.parse(values[0]);
          int two = int.parse(values[1]);
          inputValue = (one - two).toString();
        } else if (sign == "/") {
          var values = inputValue.split("/");
          int one = int.parse(values[0]);
          int two = int.parse(values[1]);
          inputValue = (one / two).toString();
        } else if (sign == "*") {
          var values = inputValue.split("*");
          int one = int.parse(values[0]);
          int two = int.parse(values[1]);
          inputValue = (one * two).toString();
        } else if (sign == "%") {
          var values = inputValue.split("%");
          int one = int.parse(values[0]);
          int two = int.parse(values[1]);
          inputValue = (one % two).toString();
        }
      } else {
        if (sign == "+") {
          var values = inputValue.split("+");
          double one = double.parse(values[0]);
          double two = double.parse(values[1]);
          inputValue = (one + two).toString();
        } else if (sign == "-") {
          var values = inputValue.split("-");
          double one = double.parse(values[0]);
          double two = double.parse(values[1]);
          inputValue = (one - two).toString();
        } else if (sign == "/") {
          var values = inputValue.split("/");
          double one = double.parse(values[0]);
          double two = double.parse(values[1]);
          inputValue = (one / two).toString();
        } else if (sign == "*") {
          var values = inputValue.split("*");
          double one = double.parse(values[0]);
          double two = double.parse(values[1]);
          inputValue = (one * two).toString();
        } else if (sign == "%") {
          var values = inputValue.split("%");
          double one = double.parse(values[0]);
          double two = double.parse(values[1]);
          inputValue = (one % two).toString();
        }
      }
      called = true;
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
          child: Center(
              child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: inputValue,
                ),
              ),
            ),
          ),
          CalButtons(
            numList: value,
            clear: clear,
            pressed: input,
            equal: equal,
          )
        ],
      ))),
    ));
  }
}
