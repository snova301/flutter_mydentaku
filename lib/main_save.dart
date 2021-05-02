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
    final Size dispsize = MediaQuery.of(context).size;
    // print(dispsize);
    final double dispsizeWidthDiv4 = (dispsize.width ~/ 4).toDouble();
    final double dispsizeWidthDiv2 = (dispsize.width ~/ 2).toDouble();
    // print(dispsizeWidthDiv4);
    // print(dispsizeWidthDiv2);
    return Column(children: <Widget>[
      Container(
          padding: const EdgeInsets.all(20),
          // color: Colors.green[100],
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Row(children: <Widget>[
            Expanded(
                child: const Text('This is the answer   ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30))),
            Expanded(
                child: Text(' $_countsymbol ', textAlign: TextAlign.center))
          ])),
      Container(
        padding: const EdgeInsets.all(20),
        child: Text('$_counter'),
        alignment: Alignment.center,
      ),
      Container(
        // padding: const EdgeInsets.all(3),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  _incrementCounter('7');
                },
                child: Text('7', style: TextStyle(fontSize: 30)),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(
                      side: BorderSide(
                    color: Colors.white,
                  )),
                  minimumSize: Size(dispsizeWidthDiv4, 80),
                )),
            ElevatedButton(
                onPressed: () {
                  _incrementCounter('8');
                },
                child: Text('8', style: TextStyle(fontSize: 30)),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(
                      side: BorderSide(
                    color: Colors.white,
                  )),
                  minimumSize: Size(dispsizeWidthDiv4, 80),
                )),
            ElevatedButton(
                onPressed: () {
                  _incrementCounter('9');
                },
                child: Text('9', style: TextStyle(fontSize: 30)),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(
                      side: BorderSide(
                    color: Colors.white,
                  )),
                  minimumSize: Size(dispsizeWidthDiv4, 80),
                )),
            ElevatedButton(
                onPressed: () {
                  _incrementCounter('/');
                },
                child: Text('÷', style: TextStyle(fontSize: 30)),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(
                      side: BorderSide(
                    color: Colors.white,
                  )),
                  minimumSize: Size(dispsizeWidthDiv4, 80),
                )),
          ],
        ),
      ),
      Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  _incrementCounter('4');
                },
                child: Text('4', style: TextStyle(fontSize: 30)),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(
                      side: BorderSide(
                    color: Colors.white,
                  )),
                  minimumSize: Size(dispsizeWidthDiv4, 80),
                )),
            ElevatedButton(
                onPressed: () {
                  _incrementCounter('5');
                },
                child: Text('5', style: TextStyle(fontSize: 30)),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(
                      side: BorderSide(
                    color: Colors.white,
                  )),
                  minimumSize: Size(dispsizeWidthDiv4, 80),
                )),
            ElevatedButton(
                onPressed: () {
                  _incrementCounter('6');
                },
                child: Text('6', style: TextStyle(fontSize: 30)),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(
                      side: BorderSide(
                    color: Colors.white,
                  )),
                  minimumSize: Size(dispsizeWidthDiv4, 80),
                )),
            ElevatedButton(
                onPressed: () {
                  _incrementCounter('*');
                },
                child: Text('×', style: TextStyle(fontSize: 30)),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(
                      side: BorderSide(
                    color: Colors.white,
                  )),
                  minimumSize: Size(dispsizeWidthDiv4, 80),
                )),
          ],
        ),
      ),
      Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  _incrementCounter('1');
                },
                child: Text('1', style: TextStyle(fontSize: 30)),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(
                      side: BorderSide(
                    color: Colors.white,
                  )),
                  minimumSize: Size(dispsizeWidthDiv4, 80),
                )),
            ElevatedButton(
                onPressed: () {
                  _incrementCounter('2');
                },
                child: Text('2', style: TextStyle(fontSize: 30)),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(
                      side: BorderSide(
                    color: Colors.white,
                  )),
                  minimumSize: Size(dispsizeWidthDiv4, 80),
                )),
            ElevatedButton(
                onPressed: () {
                  _incrementCounter('3');
                },
                child: Text('3', style: TextStyle(fontSize: 30)),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(
                      side: BorderSide(
                    color: Colors.white,
                  )),
                  minimumSize: Size(dispsizeWidthDiv4, 80),
                )),
            ElevatedButton(
                onPressed: () {
                  _incrementCounter('-');
                },
                child: Text('-', style: TextStyle(fontSize: 30)),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(
                      side: BorderSide(
                    color: Colors.white,
                  )),
                  minimumSize: Size(dispsizeWidthDiv4, 80),
                )),
          ],
        ),
      ),
      Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  _incrementCounter('0');
                },
                child: Text('0', style: TextStyle(fontSize: 30)),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(
                      side: BorderSide(
                    color: Colors.white,
                  )),
                  minimumSize: Size(dispsizeWidthDiv4, 80),
                )),
            ElevatedButton(
                onPressed: () {
                  _incrementCounter('.');
                },
                child: Text('.', style: TextStyle(fontSize: 30)),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(
                      side: BorderSide(
                    color: Colors.white,
                  )),
                  minimumSize: Size(dispsizeWidthDiv4, 80),
                )),
            ElevatedButton(
                onPressed: () {},
                child: Text(''),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(
                      side: BorderSide(
                    color: Colors.white,
                  )),
                  minimumSize: Size(dispsizeWidthDiv4, 80),
                )),
            ElevatedButton(
                onPressed: () {
                  _incrementCounter('+');
                },
                child: Text('+', style: TextStyle(fontSize: 30)),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(
                      side: BorderSide(
                    color: Colors.white,
                  )),
                  minimumSize: Size(dispsizeWidthDiv4, 80),
                )),
          ],
        ),
      ),
      Container(
          child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
        ElevatedButton(
          onPressed: () {
            _incrementCounter('C');
          },
          child: Text('C', style: TextStyle(fontSize: 30)),
          style: ElevatedButton.styleFrom(
            primary: Colors.red[300],
            onPrimary: Colors.white,
            minimumSize: Size(dispsizeWidthDiv2, 80),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            _incrementCounter('=');
          },
          child: Text('=', style: TextStyle(fontSize: 30)),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue[300],
            onPrimary: Colors.white,
            minimumSize: Size(dispsizeWidthDiv2, 80),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ]))
    ]);
  }
}
