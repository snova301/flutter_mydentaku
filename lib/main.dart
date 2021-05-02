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
  String _counter = '0'; // show value
  String _countsymbol = ''; // symbol
  int _iscalc = 0; // calc or not
  int _isequal = 0; // equal or not
  double _numtemp = 0.0;

  _incrementCounter(akey) {
    setState(() {
      double _countdouble = double.parse(_counter.toString());
      if (akey == '=') {
        if (_countsymbol == '+') {
          _countdouble = _numtemp + _countdouble;
        } else if (_countsymbol == '-') {
          _countdouble = _numtemp - _countdouble;
        } else if (_countsymbol == '*') {
          _countdouble = _numtemp * _countdouble;
        } else if (_countsymbol == '/') {
          _countdouble = _numtemp / _countdouble;
        }
        _numtemp = _countdouble;
        _counter = _countdouble.toString();
        _countsymbol = 'Ans';
        _isequal = 1;
      } else if (akey == 'C') {
        _counter = '0';
        _countsymbol = '';
        _numtemp = 0.0;
      } else if (akey == '+') {
        _numtemp = _countdouble;
        _countsymbol = '+';
        _iscalc = 1;
      } else if (akey == '-') {
        _numtemp = _countdouble;
        _countsymbol = '-';
        _iscalc = 1;
      } else if (akey == '*') {
        _numtemp = _countdouble;
        _countsymbol = '*';
        _iscalc = 1;
      } else if (akey == '/') {
        _numtemp = _countdouble;
        _countsymbol = '/';
        _iscalc = 1;
      } else if (akey == '.') {
        if (_counter == '0') {
          _counter = '0.';
          _iscalc = 0;
        } else if (_counter.contains('.') == true) {
          print('Eroor : Dot contains more than two.');
        } else {
          _counter += akey;
        }
      } else {
        //number
        if (_counter == '0' || _iscalc == 1) {
          _counter = akey;
          _iscalc = 0;
        } else if (_isequal == 1) {
          _counter = akey;
          _isequal = 0;
          _countsymbol = '';
        } else {
          _counter += akey;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // return ListView(children: <Widget>[
    return Column(children: <Widget>[
      Container(
          padding: const EdgeInsets.all(20),
          color: Colors.white,
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Row(children: <Widget>[
            Expanded(
                child: const Text('This is the answer   ',
                    textAlign: TextAlign.center)),
            Expanded(
                child: Text(' $_countsymbol ', textAlign: TextAlign.center))
          ])),
      Container(
        padding: const EdgeInsets.all(20),
        child: Text('$_counter'),
        alignment: Alignment.center,
      ),
      Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _incrementCounter('1');
              },
              child: Text('1'),
            ),
            ElevatedButton(
              onPressed: () {
                _incrementCounter('2');
              },
              child: Text('2'),
            ),
            ElevatedButton(
              onPressed: () {
                _incrementCounter('3');
              },
              child: Text('3'),
            ),
            ElevatedButton(
              onPressed: () {
                _incrementCounter('/');
              },
              child: Text('/'),
            ),
          ],
        ),
      ),
      Container(
        // padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
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
                _incrementCounter('*');
              },
              child: Text('*'),
            ),
          ],
        ),
      ),
      Container(
        // padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
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
                _incrementCounter('-');
              },
              child: Text('-'),
            ),
          ],
        ),
      ),
      Container(
        // padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
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
          ],
        ),
      ),
      Container(
          // padding: const EdgeInsets.all(20),
          child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
        ElevatedButton(
          onPressed: () {
            _incrementCounter('=');
          },
          child: Text('='),
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
            _incrementCounter('C');
          },
          child: Text('C'),
          style: ElevatedButton.styleFrom(
            primary: Colors.red[300],
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ]))
    ]);
  }
}
