import 'package:flutter/material.dart';
import 'data.dart';

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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.white,
      body: _body(context),

    );
  }

  _appBar(){
    return AppBar(
      title: Text('Abertura de Conta'),
      centerTitle: true,
      backgroundColor: Colors.deepPurple,
    );
  }

  _body(BuildContext context){
    return SingleChildScrollView(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _inputName('Nome:',nameController),
          _inputNum('Idade:',ageController),
          Row(
            children: <Widget>[
              _text('Sexo: ',_styleBlack()),
              _dropDownGender(itemGender),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          Row(
            children: <Widget>[
              _text('Escolaridade: ',_styleBlack()),
              _dropDownSch(itemSchool),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          Row(
            children: <Widget>[
              _text('Limite:',_styleBlack()),
              _slider(),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          Row(
            children: <Widget>[
              _text('Brasileiro:',_styleBlack()),
              _switch(),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),

          _button(context),

        ],
      ),
    );
  }

  _inputName(text,objController){
    return TextField(
      keyboardType: TextInputType.name,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: _styleBlack(),
      ),
      style: _styleBlack(),
      controller: objController,
    );
  }

  _inputNum(text,objController){
    return TextField(
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: _styleBlack(),
      ),
      style: _styleBlack(),
      controller: objController,
    );
  }

  _dropDownGender(list){
    return  DropdownButton<String>(
        value: genderInit,
        items: list.map<DropdownMenuItem<String>>((String value){
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? valueSelected){
          setState((){
            genderInit=valueSelected!;
          });
        }
    );
  }

  _dropDownSch(list){
    return  DropdownButton<String>(
        value: schoolingInit,
        items: list.map<DropdownMenuItem<String>>((String value){
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? valueSelected){
          setState((){
            schoolingInit=valueSelected!;
          });
        }
    );
  }

  _slider(){
    return SliderTheme(
      data: SliderThemeData(
        thumbColor: Colors.blueAccent.shade400,
        activeTrackColor: Colors.blueAccent.shade100,
        inactiveTrackColor: Colors.grey,
      ),
      child: Slider(
        value: limitInit,
        min: 400,
        max: 2400,
        divisions: 50,
        label: limitInit.round().toString(),
        onChanged: (double value){
          setState((){
            limitInit = value;
          });
        },
      ),
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
      activeTrackColor: Colors.blueAccent.shade100,
      activeColor: Colors.blueAccent.shade400,
    );
  }

  _button(BuildContext context){
    return RaisedButton(
      onPressed: (){ _confirm(context);
      },
      child: Text('Confirmar',
          style: _styleBlack()
      ),
      color: Colors.blueAccent.shade200,
    );
  }



  _text(param,estilo){
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

  _confirm(BuildContext context){
    age = int.parse(ageController.text);
    name = nameController.text;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context){
          return Data(valueAge: age,valueName: name,valueGender: genderInit,
            valueSchooling: schoolingInit,valueLimit: limitInit,valueNationality: nationalityInit,);
        },
      ),
    );
  }

}