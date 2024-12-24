import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});
  @override
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<CalculatorPage> {
  String output = ""; 
  String num1 = ""; 
  String num2 = ""; 
  String operation = ""; 

 void buttonPressed(String value) {
  setState(() {
    if (value == "AC") {
      
      output = "";
      num1 = "";
      num2 = "";
      operation = "";
    } else if (value == "+" ||
        value == "-" ||
        value == "*" ||
        value == "/" ||
        value == "%") {
      
      if (num1.isEmpty) {
        num1 = output; 
        output = ""; 
      } else {
        num2 = output; 
        _calculate(); 
        num1 = output; 
        output = ""; 
      }
      operation = value;
    } else if (value == "=") {
      
      num2 = output;
      _calculate(); 
    } else if (value == "+/-") {
      
      switch (output.startsWith("-")) {
        case true:
          output = output.substring(1); 
          break;
        case false:
          output = "-" + output; 
          break;
      }
    } else if (value == ".") {
      
      if (!output.contains(".")) {
        output += value;
      }
    } else {
      
      if (output == "") {
        output = value; 
      } else {
        output += value; 
      }
    }
  });
}

void _calculate() {
  double n1 = double.parse(num1);
  double n2 = double.parse(output);

  switch (operation) {
    case "+":
      output = (n1 + n2).toString();
      break;
    case "-":
      output = (n1 - n2).toString();
      break;
    case "*":
      output = (n1 * n2).toString();
      break;
    case "/":
      if (n2 != 0) {
        output = (n1 / n2).toString();
      } else {
        output = "Error"; 
      }
      break;
    case "%":
      output = (n1 % n2).toString(); 
      break;
  }
  
  num1 = ""; 
  num2 = "";
  operation = "";
}

  
  Widget calcbutton(String btntxt, Color btncolor, Color txtcolor, double size) {
    return ElevatedButton(
      onPressed: () {
        buttonPressed(btntxt); 
      },
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        backgroundColor: btncolor,
        padding: EdgeInsets.all(size),
      ),
      child: Text(
        btntxt,
        style: TextStyle(
          fontSize: 30,
          color: txtcolor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6A1B9A), 
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Color(0xFF6A1B9A),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    '$num1 $operation $output', 
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                    ),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('AC',  Color.fromRGBO(145, 110, 251, 1), Colors.white, 18),
                calcbutton('+/-',  Color.fromRGBO(145, 110, 251, 1), Colors.white, 18),
                calcbutton('%', Color.fromRGBO(145, 110, 251, 1), Colors.white, 18),
                calcbutton('/', Color.fromRGBO(145, 110, 251, 1), Colors.white, 20),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('7',  Color.fromRGBO(145, 110, 251, 1), Colors.white, 18),
                calcbutton('8',  Color.fromRGBO(145, 110, 251, 1), Colors.white, 18),
                calcbutton('9', Color.fromRGBO(145, 110, 251, 1), Colors.white, 18),
                calcbutton('*', Color.fromRGBO(145, 110, 251, 1), Colors.white, 20),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('4', Color.fromRGBO(145, 110, 251, 1), Colors.white, 18),
                calcbutton('5',  Color.fromRGBO(145, 110, 251, 1), Colors.white, 18),
                calcbutton('6', Color.fromRGBO(145, 110, 251, 1), Colors.white, 18),
                calcbutton('-', Color.fromRGBO(145, 110, 251, 1), Colors.white, 20),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 calcbutton('1',  Color.fromRGBO(145, 110, 251, 1), Colors.white, 18),
                calcbutton('2',  Color.fromRGBO(145, 110, 251, 1), Colors.white, 18),
                calcbutton('3', Color.fromRGBO(145, 110, 251, 1), Colors.white, 18),
                calcbutton('+', Color.fromRGBO(145, 110, 251, 1), Colors.white, 20),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    buttonPressed("0");
                  },
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor:Color.fromRGBO(145, 110, 251, 1),
                    padding: EdgeInsets.symmetric(horizontal: 75, vertical: 20),
                  ),
                  child: Text(
                    '0',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
                calcbutton('.',Color.fromRGBO(145, 110, 251, 1), Colors.white, 25),
                calcbutton('=', Color.fromRGBO(145, 110, 251, 1), Colors.white, 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
