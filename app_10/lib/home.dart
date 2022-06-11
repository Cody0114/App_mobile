import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String De = 'De';
  String Para = 'Para';
  String Resposta = "";
  double resultado = 0;

  double v1 = 0;
  double v2 = 0;

  TextEditingController n1Controller = TextEditingController();

  void _ExibirTexto() {
    v1 = double.parse(n1Controller.text);

    setState(() {
      if (De == 'Dólar' && Para == 'Reais') {
        resultado = v1 * 4.75;
      } else if (De == 'Dólar' && Para == 'Euros') {
        resultado = v1 * 0.92;
      } else if (De == 'Reais' && Para == 'Dólar') {
        resultado = v1 * 0.21;
      } else if (De == 'Reais' && Para == 'Euros') {
        resultado = v1 * 0.19;
      } else if (De == 'Euros' && Para == 'Reais') {
        resultado = v1 * 5.17;
      } else if (De == 'Euros' && Para == 'Dólar') {
        resultado = v1 * 1.09;
      } else if (De == 'Euros' && Para == 'Euros') {
        resultado = v1;
      } else if (De == 'Dólar' && Para == 'Dólar') {
        resultado = v1;
      } else if (De == 'Reais' && Para == 'Reais') {
        resultado = v1;
      }

      var resultFormat = resultado.toStringAsFixed(2);

      if (Para == 'Reais') {
        Resposta = "O resultado da conversão é\n R\$ $resultFormat";
      } else if (Para == 'Dólar') {
        Resposta = "O resultado da conversão é\n US\$ $resultFormat";
      } else if (Para == 'Euros') {
        Resposta = "O resultado da conversão é\n € $resultFormat";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      backgroundColor: Color.fromARGB(255, 223, 222, 222),
      body: _corpo(),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("CONERVSOR DE MOEDAS", style: TextStyle(color: Colors.black)),
      centerTitle: true,
      backgroundColor: Colors.yellow,
    );
  }

  _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //_imagem(),
          _texto(),
          _campo("Valor:", n1Controller),
          _dropdownDe(),
          _dropdownPara(),
          _botao(),
          _Resposta(Resposta),
        ],
      ),
    );
  }

  _campo(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: labelTitulo, labelStyle: TextStyle(color: Colors.black)),
      textAlign: TextAlign.left,
      style: TextStyle(color: Colors.black, fontSize: 22.0),
      controller: objController,
    );
  }

  _dropdownDe() {
    return DropdownButton<String>(
      value: De,
      items: <String>['De', 'Dólar', 'Reais', 'Euros'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? valorSelecionado) {
        setState(() {
          De = valorSelecionado!;
        });
      },
    );
  }

  _dropdownPara() {
    return DropdownButton<String>(
      value: Para,
      items: <String>['Para', 'Dólar', 'Reais', 'Euros'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? valorSelecionado) {
        setState(() {
          Para = valorSelecionado!;
        });
      },
    );
  }

  _botao() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _ExibirTexto,
          child: Text("CONVERTER",
              style: TextStyle(color: Colors.black, fontSize: 20.0)),
          color: Colors.green,
        ),
      ),
    );
  }

  _texto() {
    return Text(
      "\nDólar, Euros e Reais",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  _Resposta(Resposta) {
    return Text(
      Resposta,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 20.0),
    );
  }
}
