import 'package:cadusuario_frontend/model/cadastro_usuario_model.dart';
import 'package:cadusuario_frontend/service/cadastro_pesquisar_usuario_service.dart';
import 'package:rxdart/rxdart.dart';

class CadastroPesquisarUsuarioBloc {
  final BehaviorSubject _controller = BehaviorSubject();

  Sink get dataIn => _controller.sink;

  Stream<CadastroUsuarioModel> get dataOut => _controller.stream.asyncMap(
        (_) {
          Future<CadastroUsuarioModel> data = getCadastroPesquisarUsuario('20123123197'); //todo falta ver como que passa o parametro cpf para filtrar, fazer tela de input cpf e tela de exibição da busca, chamar na tela inicial
          return data; //todo ver pra rodar no web com aplicação local dio error
        },
      );

  CadastroPesquisarUsuarioBloc() {
    load();
  }

  Future<void> load() async {
    dataIn.add(null);
  }

  void dispose() {
    _controller.close();
  }
}
