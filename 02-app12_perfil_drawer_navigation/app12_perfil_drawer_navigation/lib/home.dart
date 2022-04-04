import 'package:flutter/material.dart';
import 'personal.dart';
import 'formation.dart';
import 'experience.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage = 0;
  final telas = [
    Center(child: Text('TELA HOME')),
    Pessoal(),
    Formacao(),
    Experiencia(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.white,
      body: telas[_currentPage],
      drawer: Drawer(
        child: ListView(
            children: [
              _photo(),
              //FlutterLogo(size: 45),
              Text('Angelo Marcio Sousa Santos',
                textAlign: TextAlign.center,),
              ListTile(
                title: Text('Home'),
                subtitle: Text('Seja bem-vindo ao meu perfil'),
                trailing: Icon(Icons.arrow_forward),
                onTap: (){
                  setState((){
                    _currentPage = 0;
                  });
                },
              ),
              ListTile(
                title: Text('Pessoal'),
                subtitle: Text('Quem sou eu e o que gosto'),
                trailing: Icon(Icons.account_box_outlined),
                onTap: (){
                  setState((){
                    _currentPage = 1;
                  });
                },
              ),
              ListTile(
                title: Text('Formação'),
                subtitle: Text('Meus estudos e cursos'),
                trailing: Icon(Icons.perm_device_information_sharp),
                onTap: (){
                  setState((){
                    _currentPage = 2;
                  });
                },
              ),
              ListTile(
                title: Text('Experiencia'),
                subtitle: Text('Meus projetos'),
                trailing: Icon(Icons.assignment_turned_in),
                onTap: (){
                  setState((){
                    _currentPage = 3;
                  });
                },
              ),
            ]
        ),
      ),
    );
  }

  _appBar(){
    return AppBar(
      title: Text('Meu Perfil'),
      centerTitle: true,
      backgroundColor: Colors.deepPurple,
    );
  }

  _photo(){
    return Image.network(
      "https://media-exp1.licdn.com/dms/image/C4D03AQGFbLJZPb0hJA/profile-displayphoto-shrink_200_200/0/1561121518393?e=1639612800&v=beta&t=5MnnfxOmgzmfo_G7J0duJp4gNJ71n6sNP9wLs0F7a4k",
      fit: BoxFit.contain,
      height: 80,
      width: 80,
    );
  }

}