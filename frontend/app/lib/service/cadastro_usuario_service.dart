import 'package:cadusuario_frontend/app/endpoints.dart';
import 'package:cadusuario_frontend/model/cadastro_usuario_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<CadastroUsuarioModel>> getCadastroUsuario() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Dio dio = Dio();
  dio.options.headers["apikey"] = "3909737d-a9b7-4d26-8123-0ddf6b7df908";
  dio.options.headers["token"] = prefs.getString('token');
  Response response = await dio.get(endpointCadastroUsuarioAprovado);
  if (response.statusCode == 200) {
    return (response.data as List).map((x) => CadastroUsuarioModel.fromMap(x)).toList();
  } else {
    throw Exception(response.statusCode);
  }
}

Future<CadastroUsuarioModel> postCadastroUsuario(CadastroUsuarioModel cadastroUsuarioModel) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Dio dio = Dio();
  dio.options.headers["apikey"] = "3909737d-a9b7-4d26-8123-0ddf6b7df908";
  dio.options.headers["token"] = prefs.getString('token');
  Response response = await dio.post(endpointCadastroUsuario, data: cadastroUsuarioModel.toJson());
  if (response.statusCode == 201) {
    return CadastroUsuarioModel.fromMap(response.data);
  } else {
    throw Exception(response.statusCode);
  }
}

Future<CadastroUsuarioModel> putCadastroUsuario(CadastroUsuarioModel cadastroUsuarioModel) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Dio dio = Dio();
  dio.options.headers["apikey"] = "3909737d-a9b7-4d26-8123-0ddf6b7df908";
  dio.options.headers["token"] = prefs.getString('token');
  Response response = await dio.post(endpointCadastroUsuarioAtualizar, data: cadastroUsuarioModel.toJson());
  if (response.statusCode == 201) {
    return CadastroUsuarioModel.fromMap(response.data);
  } else {
    throw Exception(response.statusCode);
  }
}