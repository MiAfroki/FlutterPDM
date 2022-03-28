import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.cyan
      ),
      home: widgetHome(),
    );
  }
}

class widgetHome extends StatelessWidget {
  const widgetHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App 01 - Hello Angelo"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Text("Hello Angelo!",
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                decoration: TextDecoration.overline,
                //decoration: TextDecoration.overline,
                decorationColor: Colors.orangeAccent,
                decorationStyle: TextDecorationStyle.dashed,
              )),
        ),
      ),
    );
  }
}
