// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Dentaku',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'This is dentaku'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _counter = '0';
  String _countsymbol = '';
  int _iscalc = 0;
  double _numtemp = 0.0;

  // _equalfunc(){

  // }

  _incrementCounter(akey) {
    setState(() {
      double _countdouble = double.parse(_counter.toString());
      if (akey == '=') {
        _countdouble = _numtemp + _countdouble;
        String _counter = _countdouble.toString();
      } else if (akey == 'C') {
        _counter = '0';
        _countsymbol = '';
      } else if (akey == '+') {
        _numtemp += _countdouble;
        _countsymbol = '+';
        _iscalc = 1;
        // _counter += akey;
      } else if (akey == '-') {
        _counter = '0';
        // _counter -= akey;
      } else if (akey == '*') {
        _counter = '0';
        // _counter *= akey;
      } else if (akey == '/') {
        _counter = '0';
        // _counter ~/= akey;
      } else {
        if (_counter == '0' || _iscalc == 1) {
          _counter = akey;
          _iscalc = 0;
        } else {
          _counter += akey;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Container(
        padding: const EdgeInsets.all(20),
        child: const Text('This is the answer'),
        color: Colors.white,
        margin: const EdgeInsets.all(10),
      ),
      Container(
        padding: const EdgeInsets.all(20),
        child: Text('$_counter'),
        // color: Colors.lightGreen[500],
      ),
      Container(
        child: Text('$_numtemp'),
      ),
      Container(
        child: Text('$_countdouble'),
      ),
      ElevatedButton(
        onPressed: () {
          _incrementCounter('1');
        },
        child: Text('1'),
        // style: ElevatedButton.styleFrom(
        //   primary: Colors.blue[300],
        //   onPrimary: Colors.white,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(10),
        //   ),
        // ),
      ),
      ElevatedButton(
        onPressed: () {
          _incrementCounter('2');
        },
        child: Text('2'),
        style: ElevatedButton.styleFrom(
          primary: Colors.blue[300],
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      ElevatedButton(
        onPressed: () {
          _incrementCounter('3');
        },
        child: Text('3'),
      ),
      ElevatedButton(
        onPressed: () {
          _incrementCounter('4');
        },
        child: Text('4'),
      ),
      ElevatedButton(
        onPressed: () {
          _incrementCounter('5');
        },
        child: Text('5'),
      ),
      ElevatedButton(
        onPressed: () {
          _incrementCounter('6');
        },
        child: Text('6'),
      ),
      ElevatedButton(
        onPressed: () {
          _incrementCounter('7');
        },
        child: Text('7'),
      ),
      ElevatedButton(
        onPressed: () {
          _incrementCounter('8');
        },
        child: Text('8'),
      ),
      ElevatedButton(
        onPressed: () {
          _incrementCounter('9');
        },
        child: Text('9'),
      ),
      ElevatedButton(
        onPressed: () {
          _incrementCounter('0');
        },
        child: Text('0'),
      ),
      ElevatedButton(
        onPressed: () {
          _incrementCounter('.');
        },
        child: Text('.'),
      ),
      ElevatedButton(
        onPressed: () {
          _incrementCounter('=');
        },
        child: Text('='),
      ),
      ElevatedButton(
        onPressed: () {
          _incrementCounter('C');
        },
        child: Text('C'),
      ),
      ElevatedButton(
        onPressed: () {
          _incrementCounter('+');
        },
        child: Text('+'),
      ),
      ElevatedButton(
        onPressed: () {
          _incrementCounter('-');
        },
        child: Text('-'),
      ),
      ElevatedButton(
        onPressed: () {
          _incrementCounter('*');
        },
        child: Text('*'),
      ),
      ElevatedButton(
        onPressed: () {
          _incrementCounter('/');
        },
        child: Text('/'),
      ),
    ]);
  }
}
