import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _switchDia = true;
  bool _switchTamanho = true;
  double tamanhoFonte = 15;
  var corFundo = Colors.black;
  var corTexto = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 187, 0),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Text('Dia'),
              _botaoSwitchDia(),
              Text('Pequeno'),
              _botaoSwitchTamanho()
            ]),
            Row(children: <Widget>[
              Flexible(
                  child: SingleChildScrollView(
                      child: Text(
                "A vingança nunca é plena, mata a alma e a envenena\n(Seu Madruga)",
                style: TextStyle(
                    fontSize: tamanhoFonte,
                    backgroundColor: corFundo,
                    color: corTexto),
              )))
            ])
          ],
        ),
      ),
    );
  }

  _botaoSwitchDia() {
    return Switch(
      value: _switchDia,
      onChanged: (value) {
        setState(() {
          _switchDia = value;
          if (value == true) {
            corFundo = Colors.white;
            corTexto = Colors.black;
          } else {
            corFundo = Colors.black;
            corTexto = Colors.white;
          }
        });
      },
    );
  }

  _botaoSwitchTamanho() {
    return Switch(
      value: _switchTamanho,
      onChanged: (value) {
        setState(() {
          _switchTamanho = value;
          if (value == true) {
            tamanhoFonte = 15.0;
          } else {
            tamanhoFonte = 50.0;
          }
        });
      },
    );
  }
}
