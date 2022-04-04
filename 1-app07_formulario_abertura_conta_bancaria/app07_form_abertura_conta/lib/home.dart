import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController nameController = new TextEditingController();
  TextEditingController ageController = new TextEditingController();

  String name = '';
  int age = 0;

  String gender ='', genderInit ='Masculino';
  List<String> itemGender = <String>['Masculino','Feminino'];

  String schooling='', schoolingInit = 'Ensino Fundamental Incompleto';
  final List<String> itemSchool = <String>[
    'Ensino Fundamental Incompleto',
    'Ensino Fundamental Completo',
    'Ensino Médio Incompleto',
    'Ensino Médio Completo',
    'Ensino Superior Completo',
    'Ensino Superior Incompleto'
  ];

  double limit =0, limitInit = 400;
  bool nationalityInit = true, nationality = false;

  void _confirmar(){
    setState(() {
      age = int.parse(ageController.text);
      name = nameController.text;
      gender = genderInit;
      schooling = schoolingInit;
      limit = limitInit;
      nationality = nationalityInit;
    });
  }




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
      title: Text('Abertura de Conta'),
      centerTitle: true,
      backgroundColor: Colors.deepPurple,
    );
  }

  _body(){
    return SingleChildScrollView(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _inputName('Nome:',nameController),
          _inputNum('Idade:',ageController),
          _texto('Sexo:',_styleBlack()),
          _dropDownBox(genderInit,itemGender),
          _texto('Escolaridade:',_styleBlack()),
          _dropDownBox(schoolingInit,itemSchool),
          _texto('Limite:',_styleBlack()),
          _slider(),
          _texto('Brasileiro:',_styleBlack()),
          _switch(),
          _button(),

          Text('Dados Informados',
            style: _styleBlue(),
            textAlign:TextAlign.center,
          ),
          _texto('Nome: $name',_styleBlue()),
          _texto('Idade: $age',_styleBlue()),
          _texto('Sexo: $gender',_styleBlue()),
          _texto('Escolaridade: $schooling',_styleBlue()),
          _texto('Limite: $limit',_styleBlue()),
          _texto('Brasileiro: $nationality',_styleBlue()),
        ],
      ),
    );
  }

  _inputName(texto,objController){
    return TextField(
      keyboardType: TextInputType.name,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        labelText: texto,
        labelStyle: _styleBlack(),
      ),
      style: _styleBlack(),
      controller: objController,
    );
  }

  _inputNum(texto,objController){
    return TextField(
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        labelText: texto,
        labelStyle: _styleBlack(),
      ),
      style: _styleBlack(),
      controller: objController,
    );
  }

  _dropDownBox(varInit,list){
    return  DropdownButton<String>(
        value: varInit,
        items: list.map<DropdownMenuItem<String>>((String value){
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? valueSelected){
          setState((){
            varInit=valueSelected!;
          });
        }
    );
  }

  _slider(){
    return Slider(
      value: limitInit,
      min: 400,
      max: 2400,
      divisions: 50,
      label: 'R\$ ' + limitInit.round().toString() + ',00',
      onChanged: (double value){
        setState((){
          limitInit = value;
        });
      },
    );
  }

  _switch(){
    return Switch(
      value: nationalityInit,
      onChanged:(value){
        setState((){
          nationalityInit=value;
        });
      },
      activeTrackColor: Colors.yellow,
      activeColor: Colors.green,
    );
  }

  _button(){
    return RaisedButton(
      onPressed: _confirmar,
      child: Text('Confirmar',
          style: _styleBlack()
      ),
      color: Colors.greenAccent,
    );
  }

  _texto(param,estilo){
    return Text(param,
      style: estilo,
      textAlign:TextAlign.left,
    );
  }


  _styleBlack(){
    return TextStyle(
      color: Colors.black,
    );
  }

  _styleBlue(){
    return TextStyle(
      color: Colors.blue.shade900,
    );
  }

}