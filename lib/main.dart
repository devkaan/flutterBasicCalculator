import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hesap Makinesi',
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basit bir hesap makinesi'),
        backgroundColor: Colors.indigo[500],
      ),
      body: Homepage(),
      backgroundColor: Colors.blue[400],
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  num num1, num2;
  dynamic result;
  String ope = '';
  TextEditingController num1Cont = new TextEditingController();
  TextEditingController num2Cont = new TextEditingController();
  plus() {
    setState(() {
      ope = '+';
      try {
        num1 = num.parse(num1Cont.text);
        num2 = num.parse(num2Cont.text);
        result = (num1 + num2);
        result = "$num1 " + ope + " $num2 = $result";
      } catch (e) {
        result = "Lütfen bir sayı gir.";
      }
    });
  }

  minus() {
    setState(() {
      ope = '-';
      try {
        num1 = num.parse(num1Cont.text);
        num2 = num.parse(num2Cont.text);
        result = (num1 - num2);
        result = "$num1 " + ope + " $num2 = $result";
      } catch (e) {
        result = "Lütfen bir sayı gir.";
      }
    });
  }

  multiply() {
    setState(() {
      ope = '*';
      try {
        num1 = num.parse(num1Cont.text);
        num2 = num.parse(num2Cont.text);
        result = (num1 * num2);
        result = "$num1 " + ope + " $num2 = $result";
      } catch (e) {
        result = "Lütfen bir sayı gir.";
      }
    });
  }

  divide() {
    setState(() {
      ope = '/';
      try {
        num1 = num.parse(num1Cont.text);
        num2 = num.parse(num2Cont.text);
        if (num2 == 0)
          result = "Hicbir sayi sifira bolunemez";
        else {
          result = (num1 / num2);
          result = "$num1 " + ope + " $num2 = $result";
        }
      } catch (e) {
        result = "Lütfen bir sayı gir.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(result.toString())
            Text((result != null ? "$result" : '')),
            TextField(
              controller: num1Cont,
            ),
            TextField(
              controller: num2Cont,
            ),
            Text('\n'),
            RaisedButton(onPressed: plus, child: myWidget('+')),
            RaisedButton(onPressed: minus, child: myWidget('-')),
            RaisedButton(onPressed: multiply, child: myWidget('*')),
            RaisedButton(onPressed: divide, child: myWidget('/')),
          ],
        ),
      ),
    );
  }
}

Widget myWidget(str) {
  return Container(
    padding: EdgeInsets.all(10),
    child: Text(
      "$str",
      style: TextStyle(fontSize: 20.0),
    ),
  );
}