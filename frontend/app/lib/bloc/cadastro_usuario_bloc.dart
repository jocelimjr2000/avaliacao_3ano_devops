import 'package:cadusuario_frontend/model/cadastro_usuario_model.dart';
import 'package:cadusuario_frontend/service/cadastro_usuario_service.dart';
import 'package:rxdart/rxdart.dart';

class CadastroUsuarioBloc {
  final BehaviorSubject _controller = BehaviorSubject();

  Sink get dataIn => _controller.sink;

  Stream<List<CadastroUsuarioModel>> get dataOut => _controller.stream.asyncMap(
        (_) {
          Future<List<CadastroUsuarioModel>> data = getCadastroUsuario();
          return data;
        },
      );

  CadastroUsuarioBloc() {
    load();
  }

  Future<void> load() async {
    dataIn.add(null);
  }

  Future<void> save(CadastroUsuarioModel cadastroUsuarioModel) async {
    await postCadastroUsuario(cadastroUsuarioModel);
  }

  Future<void> update(CadastroUsuarioModel cadastroUsuarioModel) async {
    await putCadastroUsuario(cadastroUsuarioModel);
  }

  // Future<Null> delete(CadastroUsuarioModel cadastroUsuarioModel) async {
  //   await deleteCadastroUsuario(cadastroUsuarioModel);
  //
  //   reLoad();
  // }

  void dispose() {
    _controller.close();
  }
}
