import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});
  @override
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<CalculatorPage> {
  String output = ""; // Ekrandaki gösterim
  String num1 = ""; // İlk sayı
  String num2 = ""; // İkinci sayı
  String operation = ""; // İşlem (+, -, *, /)

  // Sayı veya işlem tuşuna basıldığında çağrılacak fonksiyon
 void buttonPressed(String value) {
  setState(() {
    if (value == "AC") {
      // Her şeyi sıfırla
      output = "";
      num1 = "";
      num2 = "";
      operation = "";
    } else if (value == "+" ||
        value == "-" ||
        value == "*" ||
        value == "/" ||
        value == "%") {
      // İşlem seçildiğinde
      if (num1.isEmpty) {
        num1 = output; // İlk sayıyı kaydet
        output = ""; // Ekranı sıfırla
      } else {
        num2 = output; // İkinci sayıyı kaydet
        _calculate(); // Hesaplama yap
        num1 = output; // Sonuç num1'e kaydedilir
        output = ""; // Ekranı sıfırla
      }
      operation = value;
    } else if (value == "=") {
      // Hesaplama yap
      num2 = output;
      _calculate(); // Hesaplama işlemi
    } else if (value == "+/-") {
      // Sayının önüne - ekleme veya çıkarma işlemi
      switch (output.startsWith("-")) {
        case true:
          output = output.substring(1); // Eksi işaretini kaldır
          break;
        case false:
          output = "-" + output; // Eksi işareti ekle
          break;
      }
    } else if (value == ".") {
      // Ondalık işaretine basıldığında
      if (!output.contains(".")) {
        output += value;
      }
    } else {
      // Sayı basıldığında
      if (output == "") {
        output = value; // İlk değer
      } else {
        output += value; // Sonraki değerler
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
        output = "Error"; // Sıfıra bölme hatası
      }
      break;
    case "%":
      output = (n1 % n2).toString(); // Modül işlemi
      break;
  }
  
  num1 = ""; // Hesaplama sonrası num1 ve num2 sıfırlanır
  num2 = "";
  operation = "";
}

  // Buton widget'ı
  Widget calcbutton(String btntxt, Color btncolor, Color txtcolor, double size) {
    return ElevatedButton(
      onPressed: () {
        buttonPressed(btntxt); // Tuş tıklama işlemi
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
      backgroundColor: Color(0xFF6A1B9A), // Mor arka plan
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Color(0xFF6A1B9A),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Ekran kısmı
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    '$num1 $operation $output', // İşlem ve sayılar
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                    ),
                  ),
                ),
              ],
            ),

            // İlk tuş satırı
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('AC',  Color.fromRGBO(145, 110, 251, 1), Colors.white, 18),
                calcbutton('+/-',  Color.fromRGBO(145, 110, 251, 1), Colors.white, 18),
                calcbutton('%', Color.fromRGBO(145, 110, 251, 1), Colors.white, 18),
                calcbutton('/', Color.fromRGBO(145, 110, 251, 1), Colors.white, 20),
              ],
            ),

            // İkinci tuş satırı
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('7',  Color.fromRGBO(145, 110, 251, 1), Colors.white, 18),
                calcbutton('8',  Color.fromRGBO(145, 110, 251, 1), Colors.white, 18),
                calcbutton('9', Color.fromRGBO(145, 110, 251, 1), Colors.white, 18),
                calcbutton('*', Color.fromRGBO(145, 110, 251, 1), Colors.white, 20),
              ],
            ),

            // Üçüncü tuş satırı
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('4', Color.fromRGBO(145, 110, 251, 1), Colors.white, 18),
                calcbutton('5',  Color.fromRGBO(145, 110, 251, 1), Colors.white, 18),
                calcbutton('6', Color.fromRGBO(145, 110, 251, 1), Colors.white, 18),
                calcbutton('-', Color.fromRGBO(145, 110, 251, 1), Colors.white, 20),
              ],
            ),

            // Dördüncü tuş satırı
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 calcbutton('1',  Color.fromRGBO(145, 110, 251, 1), Colors.white, 18),
                calcbutton('2',  Color.fromRGBO(145, 110, 251, 1), Colors.white, 18),
                calcbutton('3', Color.fromRGBO(145, 110, 251, 1), Colors.white, 18),
                calcbutton('+', Color.fromRGBO(145, 110, 251, 1), Colors.white, 20),
              ],
            ),

            // Beşinci tuş satırı
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
