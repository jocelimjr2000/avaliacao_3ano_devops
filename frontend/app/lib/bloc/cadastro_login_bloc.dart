import 'package:cadusuario_frontend/model/cadastro_login_model.dart';
import 'package:cadusuario_frontend/model/cadastro_token_model.dart';
import 'package:cadusuario_frontend/service/cadastro_login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CadastroLoginBloc {
  Future<void> save(CadastroLoginModel cadastroLoginModel) async {
    CadastroTokenModel cadastroTokenModel = CadastroTokenModel();
    cadastroTokenModel = await postCadastroLogin(cadastroLoginModel);

    //Salva o token no shared preferences (salva localmente)
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', cadastroTokenModel.token!);
  }
}
