import 'dart:convert';

class CadastroTokenModel {
  String? cpf;
  String? token;

  CadastroTokenModel({
    this.cpf = '',
    this.token = '',
  });

  factory CadastroTokenModel.fromMap(Map<String, dynamic> map) {
    return CadastroTokenModel(
      cpf: map['cpf'] as String?,
      token: map['token'] as String?,
    );
  }

  factory CadastroTokenModel.fromJson(String json) {
    return CadastroTokenModel.fromMap(jsonDecode(json));
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
    'cpf': cpf,
    'token': token,
  };

  String toJson() => jsonEncode(toMap());
}
