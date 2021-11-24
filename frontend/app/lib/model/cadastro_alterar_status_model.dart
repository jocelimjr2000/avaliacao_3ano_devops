import 'dart:convert';

class CadastroAlterarStatusModel {
  bool? aprovar;
  String? cpf;

  CadastroAlterarStatusModel({
    this.aprovar = false,
    this.cpf = '',
  });

  factory CadastroAlterarStatusModel.fromMap(Map<String, dynamic> map) {
    return CadastroAlterarStatusModel(
      aprovar: map['aprovar'] as bool?,
      cpf: map['cpf'] as String?,
    );
  }

  factory CadastroAlterarStatusModel.fromJson(String json) {
    return CadastroAlterarStatusModel.fromMap(jsonDecode(json));
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
    'aprovar': aprovar,
    'cpf': cpf,
  };

  String toJson() => jsonEncode(toMap());
}
