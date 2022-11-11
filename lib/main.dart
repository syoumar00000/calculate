import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";
  bool colorChange = false;
  Color? maCouleur;
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    colorChange == false ? maCouleur = Colors.black : maCouleur = Colors.white;
    colorChange == false ? textColor = Colors.white : textColor = Colors.black;
    return Scaffold(
      backgroundColor: maCouleur,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140.0),
        child: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            color: colorChange == false ? Colors.black : Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "My Calculator",
                        style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      Image.asset(
                        "assets/logo.png",
                        height: 45,
                        width: 45,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      colorChange = !colorChange;
                    });
                  },
                  child: Text("changer de background",
                      style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                )
              ],
            ),
          ),
        ),
      ),
      body: Container(
        color: maCouleur,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Container(
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        color: Colors.grey),
                    padding: const EdgeInsets.all(20.0),
                    margin: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      output,
                      style: const TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
              ),
              Row(
                children: [
                  button("9"),
                  const SizedBox(
                    width: 5.0,
                  ),
                  button("8"),
                  const SizedBox(
                    width: 5.0,
                  ),
                  button("7"),
                  const SizedBox(
                    width: 5.0,
                  ),
                  button("/"),
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  button("4"),
                  const SizedBox(
                    width: 5.0,
                  ),
                  button("5"),
                  const SizedBox(
                    width: 5.0,
                  ),
                  button("6"),
                  const SizedBox(
                    width: 5.0,
                  ),
                  button("x"),
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  button("3"),
                  const SizedBox(
                    width: 5.0,
                  ),
                  button("2"),
                  const SizedBox(
                    width: 5.0,
                  ),
                  button("1"),
                  const SizedBox(
                    width: 5.0,
                  ),
                  button("-"),
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  button("0"),
                  const SizedBox(
                    width: 5.0,
                  ),
                  button("C"),
                  const SizedBox(
                    width: 5.0,
                  ),
                  button("="),
                  const SizedBox(
                    width: 5.0,
                  ),
                  button("+"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget button(String txt) {
    return Expanded(
      child: RawMaterialButton(
          fillColor: Colors.black45,
          padding: const EdgeInsets.all(30.0),
          splashColor: Colors.black,
          shape: RoundedRectangleBorder(
              side: const BorderSide(width: 2, color: Colors.grey),
              borderRadius: BorderRadius.circular(15)),
          child: Text(
            txt,
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
          ),
          onPressed: () {
            operation(txt);
          }),
    );
  }

  operation(String txt) {
    if (txt == "C") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (txt == "+" || txt == "-" || txt == "x" || txt == "/") {
      num1 = double.parse(output);
      operand = txt;
      _output = "0";
    } else if (txt == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "x") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + txt;
    }
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }
}
