import 'dart:convert';

class CadastroUsuarioModel {
  String? cpf;
  String? nome;
  String? dtNascimento;
  String? email;
  int? nivel;

  CadastroUsuarioModel({
    this.cpf = '',
    this.nome = '',
    this.dtNascimento = '',
    this.email = '',
    this.nivel = 0,
  });

  factory CadastroUsuarioModel.fromMap(Map<String, dynamic> map) {
    return CadastroUsuarioModel(
      cpf: map['cpf'] as String?,
      nome: map['nome'] as String?,
      dtNascimento: map['dtNascimento'] as String?,
      email: map['email'] as String?,
      nivel: map['nivel'] as int?,
    );
  }

  factory CadastroUsuarioModel.fromJson(String json) {
    return CadastroUsuarioModel.fromMap(jsonDecode(json));
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
        'cpf': cpf,
        'nome': nome,
        'dtNascimento': dtNascimento,
        'email': email,
        'nivel': nivel,
      };

  String toJson() => jsonEncode(toMap());
}
