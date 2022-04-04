import 'package:flutter/material.dart';

class Data extends StatelessWidget {
  final int valueAge;
  final String valueName, valueGender, valueSchooling;
  final double valueLimit;
  final bool valueNationality;

  const Data({required this.valueAge,required this.valueName,required this.valueGender,
    required this.valueSchooling,required this.valueLimit,required this.valueNationality});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.white,
      body: _body(),
    );
  }

  _appBar(){
    return AppBar(
      title: Text('Dados Informados'),
      centerTitle: true,
      backgroundColor: Colors.green,
    );
  }

  _body(){
    return Center(
      //padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _text('Nome: ',valueName),
          _text('Idade: ',valueAge),
          _text('Sexo: ',valueGender),
          _text('Escolaridade: ',valueSchooling),
          _text('Limite: ',valueLimit),
          _text('Brasileiro: ',valueNationality),
        ],
      ),
    );
  }

  _text(String inicio,value){
    return Text('$inicio $value',
      style: TextStyle(
        color: Colors.blueAccent.shade400,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

}