import 'package:flutter/material.dart';

class Formacao extends StatelessWidget {
  const Formacao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _texto('Formacao'),
      ],
    ));
  }

  _texto(String valor) {
    return Text(
      valor,
      style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }
}
