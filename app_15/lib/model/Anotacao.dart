import 'package:app_151/helper/AnotacaoHelper.dart';

class Anotacao {
  int id;
  String titulo;

  Anotacao(this.titulo);

  Anotacao.fromMap(Map map) {
    this.id = map["id"];
    this.titulo = map["Nome da Tarefa"];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      "Nome da Tarefa": this.titulo,
    };

    if (this.id != null) {
      map["id"] = this.id;
    }

    return map;
  }
}
