import 'dart:convert';

class CadastroLoginModel {
  String? email;
  String? senha;

  CadastroLoginModel({
    this.email = '',
    this.senha = '',
  });

  factory CadastroLoginModel.fromMap(Map<String, dynamic> map) {
    return CadastroLoginModel(
      email: map['email'] as String?,
      senha: map['senha'] as String?,
    );
  }

  factory CadastroLoginModel.fromJson(String json) {
    return CadastroLoginModel.fromMap(jsonDecode(json));
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
    'email': email,
    'senha': senha,
  };

  String toJson() => jsonEncode(toMap());
}
