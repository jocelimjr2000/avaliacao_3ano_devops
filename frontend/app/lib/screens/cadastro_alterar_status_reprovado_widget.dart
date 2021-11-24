import 'package:cadusuario_frontend/app/constants.dart';
import 'package:cadusuario_frontend/bloc/cadastro_alterar_status_reprovado_bloc.dart';
import 'package:cadusuario_frontend/model/cadastro_usuario_model.dart';
import 'package:flutter/material.dart';

class CadastroAlterarStatusReprovadoWidget extends StatefulWidget {
  const CadastroAlterarStatusReprovadoWidget({Key? key}) : super(key: key);

  @override
  _CadastroAlterarStatusReprovadoWidgetState createState() => _CadastroAlterarStatusReprovadoWidgetState();
}

class _CadastroAlterarStatusReprovadoWidgetState extends State<CadastroAlterarStatusReprovadoWidget> {
  CadastroAlterarStatusReprovadoBloc cadastroAlterarStatusReprovadoBloc = CadastroAlterarStatusReprovadoBloc();

  _body(List<CadastroUsuarioModel>? cadastroUsuarioModel) {
    List<Widget> items = [];

    if (cadastroUsuarioModel != null) {
      for (int x = 0; x < cadastroUsuarioModel.length; x++) {
        items.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cadastroUsuarioModel[x].nome.toString(),
              ),
            ],
          ),
        );
      }
    }
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: items,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(usuariosReprovados),
        backgroundColor: Colors.redAccent,
      ),
      body: StreamBuilder(
        stream: cadastroAlterarStatusReprovadoBloc.dataOut,
        builder: (BuildContext context, AsyncSnapshot<List<CadastroUsuarioModel>> snapshot) {
          if (snapshot.hasData) {
            return RefreshIndicator(
              child: _body(snapshot.data),
              onRefresh: cadastroAlterarStatusReprovadoBloc.load,
            );
          } else if (snapshot.hasError) {
            return snapshot.error as Widget;
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  @override
  void dispose() {
    cadastroAlterarStatusReprovadoBloc.dispose();
    super.dispose();
  }
}
