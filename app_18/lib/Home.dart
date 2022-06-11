import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController cepController = TextEditingController();
  String info_endereco = '';

  _recuperarCep() async {
    String url = 'https://api.github.com/users/${cepController.text}';

    print(url);

    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    String avatar = retorno["avatar_url"];
    int id = retorno["id"];
    String name = retorno["name"];
    int public_repos = retorno["public_repos"];
    String created_at = retorno["created_at"];
    int followers = retorno["followers"];
    int following = retorno["following"];

    setState(() {
      /*Logradouro: $logradouro \n Bairro: $bairro \n Cidade: $localidade \n Estado: $uf*/
      info_endereco =
          '$avatar \n \n \n Nome: $name \n Id:$id \n Repositorios Criados:$public_repos \n Criado em:$created_at \n Numero de Seguidores:$followers \n Seguindo:$following \n ';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil dos Devs"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Digite o login do GitHub",
                  labelStyle: TextStyle(color: Colors.brown)),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.brown, fontSize: 25.0),
              controller: cepController,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: _recuperarCep,
                  child: Text("Buscar",
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  color: Colors.blue,
                ),
              ),
            ),
            Text(info_endereco),
          ],
        ),
      ),
    );
  }
}
