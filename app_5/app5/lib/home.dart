import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController peso = TextEditingController();
  TextEditingController altura = TextEditingController();

  String infoResultado = "Classificação:";

  String calculo = " seu imc aparecerá aqui";

  void _calcularIMC() {
    setState(() {
      double n1 = double.parse(peso.text);
      double n2 = double.parse(altura.text);

      double imc = n1 / (n2 * n2);

      if (imc < 18.5) {
        infoResultado = 'Abaixo do peso';
      } else if (imc >= 18.5 && imc < 24.9) {
        infoResultado = 'Peso normal';
      } else if (imc >= 25 && imc < 29.9) {
        infoResultado = 'Sobrepeso';
      } else if (imc >= 30 && imc < 34.9) {
        infoResultado = 'Obesidade grau I';
      } else if (imc >= 35 && imc < 39.9) {
        infoResultado = 'Obesidade grau II';
      } else if (imc >= 40) {
        infoResultado = 'Obesidade mórbida';
      }
      calculo = " resultado imc:" + imc.toStringAsPrecision(3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      backgroundColor: Colors.white,
      body: _corpo(),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Calculo do IMC"),
      centerTitle: true,
      backgroundColor: Colors.black,
    );
  }

  _foto() {
    return Image.asset(
      'assets/images/imc.png',
      height: 300,
      width: 300,
    );
  }

  _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _foto(),
          _campo("Peso", peso),
          _campo("Altura", altura),
          _botao(),
          _texto(infoResultado, calculo)
          // _textoa(calculo)
        ],
      ),
    );
  }

  _campo(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: labelTitulo, labelStyle: TextStyle(color: Colors.black)),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 25.0),
      controller: objController,
    );
  }

  _botao() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _calcularIMC,
          child: Text("Verificar",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Colors.green,
        ),
      ),
    );
  }

  _texto(textoParaExibir, imcdapessoa) {
    return Text(
      textoParaExibir + imcdapessoa,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.red, fontSize: 25.0),
    );
  }
}
