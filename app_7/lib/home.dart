import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool valorPreenchido = false;
  var nomeInf, idadeInf, sexoInf, escolaridadeInf, limiteInf, nacionalidadeInf;

  TextEditingController nomeController = TextEditingController();
  TextEditingController idadeController = TextEditingController();

  bool valorSwitchNacionalidade = false;
  String dropdownSexo = 'Feminino';
  String dropdownEscolaridade = 'Fundamental';
  double valorSlider = 100.00;
  String nacionalidade = 'Brasileiro';

  _dadosInformados() {
    setState(() {
      if (nomeController.text.isNotEmpty && idadeController.text.isNotEmpty) {
        nomeInf = nomeController.text;
        idadeInf = idadeController.text;
        sexoInf = dropdownSexo;
        escolaridadeInf = dropdownEscolaridade;
        limiteInf = valorSlider;
        nacionalidadeInf = nacionalidade;
        valorPreenchido = true;
      } else {
        valorPreenchido = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: _corpo(),
    );
  }

  /// ok
  _titulo() {
    return AppBar(
      title: Text("Abertura de Conta"),
      centerTitle: true,
      backgroundColor: Colors.cyan,
    );
  }

  /// ok
  _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _campo(),
          _botao(),
          _resultado(valorPreenchido),
        ],
      ),
    );
  }

  /// ok
  _campo() {
    return Container(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _campoNome("Nome", nomeController),
              _campoNum("Idade", idadeController),
              _sexo(),
              _escolaridade(),
              _texto("Limite:"),
              _limite(),
              _texto(nacionalidade),
              _switch(),
            ]));
  }

  /// ok
  _campoNome(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: labelTitulo,
          labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
      textAlign: TextAlign.center,
      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 20.0),
      controller: objController,
    );
  }

  /// ok
  _campoNum(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: labelTitulo,
          labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
      textAlign: TextAlign.center,
      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 20.0),
      controller: objController,
    );
  }

  /// ok
  _sexo() {
    return DropdownButton<String>(
      value: dropdownSexo,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      underline: Container(
        height: 2,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownSexo = newValue!;
        });
      },
      items: <String>['Feminino', 'Masculino']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  /// OK
  _escolaridade() {
    return DropdownButton<String>(
      value: dropdownEscolaridade,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      underline: Container(
        height: 2,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownEscolaridade = newValue!;
        });
      },
      items: <String>['Fundamental', 'Médio', 'Superior', 'Pos graduado']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  /// ok
  _botao() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: () {
            setState(() {
              _dadosInformados();
            });
          },
          child: Text("Confirmar",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }

  _texto(String valor) {
    return Text(
      valor,
      style: TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontSize: 16,
      ),
    );
  }

  /// OK
  _limite() {
    return Slider(
      value: valorSlider,
      min: 100,
      max: 5000,
      divisions: 50,
      label: valorSlider.round().toString(),
      onChanged: (double value) {
        setState(() {
          valorSlider = value;
        });
      },
      thumbColor: Color.fromARGB(255, 112, 111, 111),
      activeColor: Color.fromARGB(255, 0, 0, 0),
    );
  }

  /// OK
  _switch() {
    return Switch(
      value: valorSwitchNacionalidade,
      onChanged: (value) {
        setState(() {
          valorSwitchNacionalidade = value;
          nacionalidade =
              valorSwitchNacionalidade ? 'Brasileiro' : 'Estrangeiro';
        });
      },
      activeTrackColor: Color.fromARGB(255, 0, 0, 0),
      activeColor: Color.fromARGB(255, 0, 0, 0),
    );
  }

  _resultado(bool valorPreenchidos) {
    if (valorPreenchidos) {
      return Container(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _texto("Dados informados"),
            _texto("Nome: $nomeInf"),
            _texto("Idade: $idadeInf"),
            _texto("Sexo: $sexoInf"),
            _texto("Escolaridade: $escolaridadeInf"),
            _texto("Limite: $limiteInf"),
            _texto("Nacionalidade: $nacionalidadeInf"),
          ],
        ),
      );
    } else {
      return Text(
        "Todos os campos devem ser preenchidos",
        textAlign: TextAlign.center,
        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 22.0),
      );
    }
  }
}
