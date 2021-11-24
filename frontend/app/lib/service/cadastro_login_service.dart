import 'package:cadusuario_frontend/app/endpoints.dart';
import 'package:cadusuario_frontend/model/cadastro_login_model.dart';
import 'package:cadusuario_frontend/model/cadastro_token_model.dart';
import 'package:dio/dio.dart';

Future<CadastroTokenModel> postCadastroLogin(CadastroLoginModel cadastroLoginModel) async {
  Dio dio = Dio();
  dio.options.headers["apikey"] = "3909737d-a9b7-4d26-8123-0ddf6b7df908";
  Response response = await dio.post(endpointCadastroLogin, data: cadastroLoginModel.toJson());
  if (response.statusCode == 200) {
    return CadastroTokenModel.fromMap(response.data);
  } else {
    throw Exception(response.statusCode);
  }
}