import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();
  String infoResultado = '';

  void multiplicar(){
    setState((){
      double n1 = double.parse(n1Controller.text);
      double n2 = double.parse(n2Controller.text);
      double resultado = n1 * n2;

      infoResultado = 'Resultado: $resultado';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiplicador de Números'),
        centerTitle: true,
        backgroundColor:Colors.deepPurple,
      ),
      backgroundColor: Colors.white,
      body: _body(),
    );
  }

  _body(){
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _inputNumero(n1Controller,'Digite o primeiro nº'),
          _inputNumero(n2Controller,'Digite o segundo nº'),
          _padding(),
          _outputNumero(),
        ],
      ),
    );
  }

  _inputNumero(variavel,texto){
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText:texto,
        labelStyle: _labelStyle(),
      ),
      textAlign: TextAlign.center,
      style: _textStyle(),
      controller: variavel,
    );
  }

  _outputNumero(){
    return Text(
      infoResultado,
      style: _textStyle(),
      textAlign: TextAlign.center,
    );
  }

  _labelStyle(){
    return TextStyle(
        color: Colors.blueAccent);
  }

  _textStyle(){
    return TextStyle(
        color: Colors.black,
        fontSize: 25);
  }

  _padding(){
    return Padding(
        padding: EdgeInsets.only(top: 20, bottom: 20),
        child: Container(
          height:35,
          child: _button(),
        )
    );
  }

  _button(){
    return RaisedButton(
      onPressed: multiplicar,
      child: Text('Calcular',
        style: _textStyle(),
      ),
      color: Colors.blueAccent,
    );
  }
}