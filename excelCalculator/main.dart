import 'package:flutter/material.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget{
  const Calculator({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Excelcalculator',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget{
  const SimpleCalculator({super.key});

  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator>{
  String output = '0';
  String _output = '0';
  double num1 = 0;
  double num2 = 0;
  String operand = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: Text(
                output,
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            new Column(
              children: [
                new Row(
                  children: [
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("/"),
                  ],
                ),
                new Row(
                  children: [
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("x"),
                  ],
                ),
                new Row(
                  children: [
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("-"),
                  ],
                ),
                new Row(
                  children: [
                    buildButton("."),
                    buildButton("0"),
                    buildButton("00"),
                    buildButton("+"),
                  ],
                ),
                new Row(
                  children: [
                    buildButton("AC"),
                    buildButton("="),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildButton(String buttonText){
    return Expanded(
      child: SizedBox(
        height: 70.0,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: OutlinedButton(
            child: Text(
              buttonText,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            onPressed: () => buttonPressed(buttonText),
          ),
        ),
      ),
    );
  }

  buttonPressed(String buttonPressed) {
    if(buttonPressed == 'AC'){
      _output = '0';
      num1 = 0;
      num2 = 0;
      operand = "";
    }
    else if(buttonPressed == '+'  || buttonPressed == '-'  || buttonPressed == '/'  || buttonPressed == 'x'){
      num1 = double.parse(output);
      operand = buttonPressed;
      _output = "0";
    } else if(buttonPressed == '.'){
      if(_output.contains(".")){
        print("Already contains a decimal");
      }else{
        _output = _output + buttonPressed;
      }
    } else if(buttonPressed == '='){
      num2 = double.parse(output);
      if(operand == '+'){
        _output = (num1 + num2).toString();
      }
      if(operand == '-'){
        _output = (num1 - num2).toString();
      }
      if(operand == 'x'){
        _output = (num1 * num2).toString();
      }
      if(operand == '/'){
        _output = (num1/num2).toString();
      }
      num1 = 0;
      num2 = 0;
      operand = '';
    } else{
      _output = _output + buttonPressed;
    }
    print("answer is $_output");
    setState(() {
      output = double.parse(_output).toString().replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "");
    });
  }
}