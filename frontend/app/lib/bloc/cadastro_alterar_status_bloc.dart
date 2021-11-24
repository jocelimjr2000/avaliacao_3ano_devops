import 'package:cadusuario_frontend/model/cadastro_alterar_status_model.dart';
import 'package:cadusuario_frontend/model/cadastro_usuario_model.dart';
import 'package:cadusuario_frontend/service/cadastro_alterar_status_service.dart';
import 'package:rxdart/rxdart.dart';

class CadastroAlterarStatusBloc {

  final BehaviorSubject _controller = BehaviorSubject();

  Sink get dataIn => _controller.sink;

  Stream<List<CadastroUsuarioModel>> get dataOut => _controller.stream.asyncMap(

        (_) {
      Future<List<CadastroUsuarioModel>> data = getCadastroAlterarStatus();

      return data;
    },
  );

  CadastroAlterarStatusBloc() {

    load();
  }

  Future<void> load() async {
    dataIn.add(null);
  }

  Future<void> save(CadastroAlterarStatusModel cadastroAlterarStatusModel) async {
    await postCadastroAlterarStatus(cadastroAlterarStatusModel);
  }

  void dispose() {
    _controller.close();
  }

}
