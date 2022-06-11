import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController gasolina = TextEditingController();
  TextEditingController alcool = TextEditingController();

  String infoResultado = "Resultado:";

  void _calcularSoma() {
    setState(() {
      double n1 = double.parse(gasolina.text);
      double n2 = double.parse(alcool.text);

      double resultado = (n2 / n1);

      if (resultado <= 0.7) {
        infoResultado = 'Álcool vale mais!';
      } else {
        infoResultado = 'Gasolina vale mais!';
      }
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
      title: Text("Álcool ou Gasolina"),
      centerTitle: true,
      backgroundColor: Colors.orange,
    );
  }

  _foto() {
    return Center(
      child: Image.network(
        'https://costanorte.com.br/image/policy:1.345840.1633550655:1633550655/image.jpg?f=2x1&w=1016',
        height: 200,
        width: 200,
      ),
    );
  }

  _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _foto(),
          _campo("Valor da gasolina", gasolina),
          _campo("Valor do alcool", alcool),
          _botao(),
          _texto(infoResultado),
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
          onPressed: _calcularSoma,
          child: Text("Verificar",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Colors.green,
        ),
      ),
    );
  }

  _texto(textoParaExibir) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.red, fontSize: 25.0),
    );
  }
}
