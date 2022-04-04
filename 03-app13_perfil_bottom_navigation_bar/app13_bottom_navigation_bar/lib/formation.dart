import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Formation extends StatelessWidget {
  const Formation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Center(child: Text('Formação'));
  }
}