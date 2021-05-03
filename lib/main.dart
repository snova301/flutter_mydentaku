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
          scaffoldBackgroundColor: Colors.grey[800]),
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
        // _countdouble = _eqaulcalc(_numtemp, _countdouble, _countsymbol);
        if (_countsymbol == '+') {
          _countdouble = _numtemp + _countdouble;
        } else if (_countsymbol == '-') {
          _countdouble = _numtemp - _countdouble;
        } else if (_countsymbol == '×') {
          _countdouble = _numtemp * _countdouble;
        } else if (_countsymbol == '÷') {
          _countdouble = _numtemp / _countdouble;
        }
        _numtemp = _countdouble;
        _counter = _countdouble.toString();
        _countsymbol = 'ANS';
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
      } else if (akey == '×') {
        _numtemp = _countdouble;
        _countsymbol = '×';
        _iscalc = 1;
      } else if (akey == '÷') {
        _numtemp = _countdouble;
        _countsymbol = '÷';
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
          if (akey == '00') {
            _counter = '0';
          } else {
            _counter = akey;
          }
          _iscalc = 0;
        } else if (_isequal == 1) {
          if (akey == '00') {
            _counter = '0';
          } else {
            _counter = akey;
          }
          _isequal = 0;
          _countsymbol = '';
        } else if (_counter.length > 12) {
          print('');
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

    final double _btSizeWidth = (dispsize.width ~/ 4.4).toDouble();
    final double _btSizeHeight = _btSizeWidth;
    final double _btSizePadding = (dispsize.width ~/ 50).toDouble();
    final double _containerSizeWidth1 = (dispsize.width ~/ 2.2).toDouble();
    final double _containerSizeWidth2 = _containerSizeWidth1 * 2;
    final double _containerSizeHeight2 = (dispsize.height ~/ 8).toDouble();
    final double _btFontSize = (dispsize.width ~/ 12).toDouble();
    final double _windowFontSize = (dispsize.height ~/ 20).toDouble();
    final colorBtBoxNum = Colors.blueGrey[700];
    final colorBtTextNum = Colors.white;
    final colorBtBorder = Colors.white54;
    final colorContainer = Colors.grey[700];

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green[900],
          title: const Text(
            'Bottom Calculator',
            textAlign: TextAlign.center,
          ),
        ),
        body: Column(children: <Widget>[
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(_btSizePadding),
              child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      _incrementCounter('7');
                    },
                    child: Text('7', style: TextStyle(fontSize: _btFontSize)),
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(
                            side: BorderSide(
                          color: colorBtBorder,
                        )),
                        primary: colorBtBoxNum,
                        onPrimary: colorBtTextNum,
                        minimumSize: Size(_btSizeWidth, _btSizeHeight))),
                ElevatedButton(
                    onPressed: () {
                      _incrementCounter('8');
                    },
                    child: Text('8', style: TextStyle(fontSize: _btFontSize)),
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(
                            side: BorderSide(
                          color: colorBtBorder,
                        )),
                        primary: colorBtBoxNum,
                        onPrimary: colorBtTextNum,
                        minimumSize: Size(_btSizeWidth, _btSizeHeight))),
                ElevatedButton(
                    onPressed: () {
                      _incrementCounter('9');
                    },
                    child: Text('9', style: TextStyle(fontSize: _btFontSize)),
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(
                            side: BorderSide(
                          color: colorBtBorder,
                        )),
                        primary: colorBtBoxNum,
                        onPrimary: colorBtTextNum,
                        minimumSize: Size(_btSizeWidth, _btSizeHeight))),
                ElevatedButton(
                    onPressed: () {
                      _incrementCounter('÷');
                    },
                    child: Text('÷', style: TextStyle(fontSize: _btFontSize)),
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(
                            side: BorderSide(
                          color: colorBtBorder,
                        )),
                        // primary: colorBtBoxNum,
                        // onPrimary: colorBtTextNum,
                        minimumSize: Size(_btSizeWidth, _btSizeHeight))),
              ])),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(_btSizePadding),
              child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      _incrementCounter('4');
                    },
                    child: Text('4', style: TextStyle(fontSize: _btFontSize)),
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(
                            side: BorderSide(
                          color: colorBtBorder,
                        )),
                        primary: colorBtBoxNum,
                        onPrimary: colorBtTextNum,
                        minimumSize: Size(_btSizeWidth, _btSizeHeight))),
                ElevatedButton(
                    onPressed: () {
                      _incrementCounter('5');
                    },
                    child: Text('5', style: TextStyle(fontSize: _btFontSize)),
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(
                            side: BorderSide(
                          color: colorBtBorder,
                        )),
                        primary: colorBtBoxNum,
                        onPrimary: colorBtTextNum,
                        minimumSize: Size(_btSizeWidth, _btSizeHeight))),
                ElevatedButton(
                    onPressed: () {
                      _incrementCounter('6');
                    },
                    child: Text('6', style: TextStyle(fontSize: _btFontSize)),
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(
                            side: BorderSide(
                          color: colorBtBorder,
                        )),
                        primary: colorBtBoxNum,
                        onPrimary: colorBtTextNum,
                        minimumSize: Size(_btSizeWidth, _btSizeHeight))),
                ElevatedButton(
                    onPressed: () {
                      _incrementCounter('×');
                    },
                    child: Text('×', style: TextStyle(fontSize: _btFontSize)),
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(
                            side: BorderSide(
                          color: colorBtBorder,
                        )),
                        // primary: colorBtBoxNum,
                        // onPrimary: colorBtTextNum,
                        minimumSize: Size(_btSizeWidth, _btSizeHeight))),
              ])),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(_btSizePadding),
              child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      _incrementCounter('1');
                    },
                    child: Text('1', style: TextStyle(fontSize: _btFontSize)),
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(
                            side: BorderSide(
                          color: colorBtBorder,
                        )),
                        primary: colorBtBoxNum,
                        onPrimary: colorBtTextNum,
                        minimumSize: Size(_btSizeWidth, _btSizeHeight))),
                ElevatedButton(
                    onPressed: () {
                      _incrementCounter('2');
                    },
                    child: Text('2', style: TextStyle(fontSize: _btFontSize)),
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(
                            side: BorderSide(
                          color: colorBtBorder,
                        )),
                        primary: colorBtBoxNum,
                        onPrimary: colorBtTextNum,
                        minimumSize: Size(_btSizeWidth, _btSizeHeight))),
                ElevatedButton(
                    onPressed: () {
                      _incrementCounter('3');
                    },
                    child: Text('3', style: TextStyle(fontSize: _btFontSize)),
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(
                            side: BorderSide(
                          color: colorBtBorder,
                        )),
                        primary: colorBtBoxNum,
                        onPrimary: colorBtTextNum,
                        minimumSize: Size(_btSizeWidth, _btSizeHeight))),
                ElevatedButton(
                    onPressed: () {
                      _incrementCounter('-');
                    },
                    child: Text('-', style: TextStyle(fontSize: _btFontSize)),
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(
                            side: BorderSide(
                          color: colorBtBorder,
                        )),
                        // primary: colorBtBoxNum,
                        // onPrimary: colorBtTextNum,
                        minimumSize: Size(_btSizeWidth, _btSizeHeight))),
              ])),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(_btSizePadding),
              child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      _incrementCounter('0');
                    },
                    child: Text('0', style: TextStyle(fontSize: _btFontSize)),
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(
                            side: BorderSide(
                          color: colorBtBorder,
                        )),
                        primary: colorBtBoxNum,
                        onPrimary: colorBtTextNum,
                        minimumSize: Size(_btSizeWidth, _btSizeHeight))),
                ElevatedButton(
                    onPressed: () {
                      _incrementCounter('00');
                    },
                    child: Text('00', style: TextStyle(fontSize: _btFontSize)),
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(
                            side: BorderSide(
                          color: colorBtBorder,
                        )),
                        primary: colorBtBoxNum,
                        onPrimary: colorBtTextNum,
                        minimumSize: Size(_btSizeWidth, _btSizeHeight))),
                ElevatedButton(
                    onPressed: () {
                      _incrementCounter('.');
                    },
                    child: Text('.', style: TextStyle(fontSize: _btFontSize)),
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(
                            side: BorderSide(
                          color: colorBtBorder,
                        )),
                        minimumSize: Size(_btSizeWidth, _btSizeHeight))),
                ElevatedButton(
                    onPressed: () {
                      _incrementCounter('+');
                    },
                    child: Text('+', style: TextStyle(fontSize: _btFontSize)),
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(
                            side: BorderSide(
                          color: colorBtBorder,
                        )),
                        minimumSize: Size(_btSizeWidth, _btSizeHeight))),
              ])),
          Container(
              padding: EdgeInsets.all(_btSizePadding),
              alignment: Alignment.center,
              child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    _incrementCounter('C');
                  },
                  child: Text('C', style: TextStyle(fontSize: _btFontSize)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red[400],
                    onPrimary: Colors.white,
                    minimumSize:
                        Size(_containerSizeWidth1, _btSizeHeight / 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _incrementCounter('=');
                  },
                  child: Text('=', style: TextStyle(fontSize: _btFontSize)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[400],
                    onPrimary: Colors.white,
                    minimumSize:
                        Size(_containerSizeWidth1, _btSizeHeight / 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ])),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(_btSizePadding),
              child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Container(
                    alignment: Alignment.bottomRight,
                    height: _containerSizeHeight2,
                    width: _containerSizeWidth2,
                    child: Text(' $_counter ',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: _windowFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ))),
              ])),
        ]));
  }
}
