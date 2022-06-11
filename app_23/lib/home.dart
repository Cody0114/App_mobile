import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

String dropButton = "";

class _HomePageState extends State<HomePage> {
  File file;
  TextEditingController nomeController = TextEditingController();
  String dropdownArea = 'Não declarado';

  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criação de crachás"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            file != null
                ? Image.file(file)
                : Image.asset(
                    "assets/images/camera.png",
                    height: 150,
                  ),
            _botaoCamera(),
            _botaoGaleria(),
            _nome(),
            _dropdownArea(),
            _salvar()
          ],
        ),
      ),
    );
  }

  _botaoCamera() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 35.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _getImagemFromGaleria,
          child: Text("Câmera",
              style: TextStyle(color: Colors.white, fontSize: 35.0)),
          color: Color.fromARGB(255, 87, 143, 226),
        ),
      ),
    );
  }

  _botaoGaleria() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 35.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _getImagemFromGaleria,
          child: Text("Galeria",
              style: TextStyle(color: Colors.white, fontSize: 35.0)),
          color: Color.fromARGB(255, 87, 143, 226),
        ),
      ),
    );
  }

  _nome() {
    return TextField(
      decoration: InputDecoration(
          labelText: "Nome:",
          labelStyle: TextStyle(color: Colors.black, fontSize: 25)),
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
      ),
      controller: nomeController,
    );
  }

  _dropdownArea() {
    return DropdownButton<String>(
      value: dropdownArea,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.black, fontSize: 25),
      underline: Container(
        height: 2,
        color: Color.fromARGB(255, 28, 80, 175),
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownArea = newValue;
        });
      },
      items: <String>['Financeiro', 'Administrativo', 'Não declarado']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  _recuperarBancoDados() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "banco.db");

    var bd = await openDatabase(localBancoDados, version: 1,
        onCreate: (db, dbVersaoRecente) {
      String sql =
          "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, area INTEGER) ";
      db.execute(sql);
    });

    return bd;
    //print("aberto: " + bd.isOpen.toString() );
  }

  _salvar() async {
    Database bd = await _recuperarBancoDados();

    Map<String, dynamic> dadosUsuario = {
      "nome": "Caique Alves",
      "idade": 21,
    };
    int id = await bd.insert("usuarios", dadosUsuario);
    print("Salvo: $id ");
  }

  void _getImagemFromCamera() async {
    File foto =
        (await ImagePicker().pickImage(source: ImageSource.camera)) as File;

    setState(() {
      this.file = foto;
    });
  }

  void _getImagemFromGaleria() async {
    File foto = ImagePicker().pickImage(source: ImageSource.gallery) as File;
    setState(() {
      this.file = foto;
    });
  }

  _drodownButton() {
    return DropdownButton<String>(
      items: <String>['Suporte', 'APIs', 'DBA'].map((String value) {
        return new DropdownMenuItem<String>(
          value: value,
          child: new Text(value),
        );
      }).toList(),
      onChanged: (String newValue) {
        setState(() {
          dropButton = newValue;
        });
      },
      value: dropButton,
    );
  }

  join(String caminhoBancoDados, String s) {}
}
