import 'experience.dart';
import 'formation.dart';
import 'personal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage = 0;

  final screens = [
    Center(child: Text("Home")),
    Formation(),
    Experience(),
    Personal()
  ];

  final colors = [
    Colors.amberAccent,
    Colors.deepPurpleAccent,
    Colors.redAccent,
    Colors.blueAccent
  ];

  final titles = [
    "Home",
    "Formação",
    "Experiência",
    "Pessoal"
  ];

  void _onItemTapped(int index){
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_currentPage]),
        centerTitle: true,
        backgroundColor: colors[_currentPage],
      ),
      backgroundColor: Colors.white,
      body: screens[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
              backgroundColor: colors[0]
          ),
          BottomNavigationBarItem(
              label: "Formação",
              icon: Icon(Icons.school),
              backgroundColor: colors[1]
          ),
          BottomNavigationBarItem(
              label: "Experiência",
              icon: Icon(Icons.work),
              backgroundColor: colors[2]
          ),
          BottomNavigationBarItem(
              label: "Pessoal",
              icon: Icon(Icons.person),
              backgroundColor: colors[3]
          ),
        ],
        currentIndex: _currentPage,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}