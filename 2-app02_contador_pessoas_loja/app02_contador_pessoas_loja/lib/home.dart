import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int people = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _title(),
        body: _body()
    );
  }

  _title() {
    return AppBar(
      title: Text("Contador de Pessoas\n presentes na Loja"),
      centerTitle: true,
      backgroundColor: Colors.deepPurple,
    );
  }

  _body() {
    return Container (
        width: double.infinity,
        color: Colors.black,
        child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _text(people),
              Row (
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _button("+", Colors.green, _plus),
                    _button("-", Colors.red, _minus)
                  ]
              )
            ]
        )
    );
  }

  _text(content) {
    return Text(
      content.toString(),
      style: TextStyle(
        color: Colors.red,
        fontSize: 80,
      ),
    );
  }

  _button(label, color, onpress) {
    return ButtonTheme(
      minWidth: 100.0,
      height: 70.0,
      child: RaisedButton(
        color: color,
        onPressed: onpress,
        child: Text(
            label,
            style: TextStyle(fontSize: 50)
        ),
      ),
    );
  }

  _plus() {
    setState(() {
      people++;
    });
  }

  _minus() {
    setState(() {
      if(people > 0)
        people--;
    });
  }
}