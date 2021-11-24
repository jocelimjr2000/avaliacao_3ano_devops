import 'package:cadusuario_frontend/model/cadastro_usuario_model.dart';
import 'package:cadusuario_frontend/service/cadastro_alterar_status_reprovado_service.dart';
import 'package:rxdart/rxdart.dart';

class CadastroAlterarStatusReprovadoBloc {
  final BehaviorSubject _controller = BehaviorSubject();

  Sink get dataIn => _controller.sink;

  Stream<List<CadastroUsuarioModel>> get dataOut => _controller.stream.asyncMap(
        (_) {
          Future<List<CadastroUsuarioModel>> data = getCadastroAlterarStatusReprovado();

          return data;
        },
      );

  CadastroAlterarStatusReprovadoBloc() {
    load();
  }

  Future<void> load() async {
    dataIn.add(null);
  }

  void dispose() {
    _controller.close();
  }
}
