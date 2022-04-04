import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Vaga {
  String title;
  double wage;
  String description;
  String contact;

  Vaga (this.title, this.wage, this.description, this.contact);
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Vagas"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.white,
      body: _corpo(),
    );
  }

  _corpo(){
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget> [
            _carrosel(),
          ],
        )
    );
  }

  _carrosel() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      height: 500,
      child: ListView(
        children: <Widget>[
          _item(Vaga("Desenvolvedor(a)", 2500, "Home Office", "(000) 0000-0000")),
          _item(Vaga("Desenvolvedor Junior", 1500, "Em Lisboa", "(000) 0000-0000")),
          _item(Vaga("Desenvolvedor Junior II", 3500, "Híbrido em São Paulo", "(000) 0000-0000")),
          _item(Vaga("Desenvolvedor Senior", 9500, "Em Campinas", "(000) 0000-0000")),
          _item(Vaga("Desenvolvedor Back-End", 3500, "Home Office", "(000) 0000-0000")),
          _item(Vaga("Desenvolvedor Front-End", 2500, "Home Office", "(000) 0000-0000")),
          _item(Vaga("Desenvolvedor Mobile", 1800, "Híbrido em Praia Grande", "(000) 0000-0000")),
        ],
      ),
    );
  }

  _item(Vaga item){
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        padding: EdgeInsets.only(top: 10, bottom: 10),
        color: Colors.greenAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _title(item.title),
            _wage(item.wage),
            _description(item.description),
            _contact(item.contact)
          ],
        ),
      ),
    );
  }

  _title(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.red,
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decorationColor: Colors.red,
      ),
    );
  }

  _description(String description) {
    return Text(
      "Descrição: " + description,
      style: TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decorationColor: Colors.red,
      ),
    );
  }

  _wage(double wage) {
    return Text(
      "Salário: R\$ ${wage.toStringAsPrecision(6)}",
      style: TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decorationColor: Colors.red,
      ),
    );
  }

  _contact(String contact) {
    return Text(
      "Contato: " + contact,
      style: TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decorationColor: Colors.red,
      ),
    );
  }
}