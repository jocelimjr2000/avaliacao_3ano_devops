import 'package:cadusuario_frontend/app/constants.dart';
import 'package:cadusuario_frontend/bloc/cadastro_usuario_bloc.dart';
import 'package:cadusuario_frontend/functions/open.dart';
import 'package:cadusuario_frontend/model/cadastro_usuario_model.dart';
import 'package:cadusuario_frontend/screens/cadastro_usuario_form_widget.dart';
import 'package:flutter/material.dart';

class CadastroUsuarioWidget extends StatefulWidget {
  const CadastroUsuarioWidget({Key? key}) : super(key: key);

  @override
  _CadastroUsuarioWidgetState createState() => _CadastroUsuarioWidgetState();
}

class _CadastroUsuarioWidgetState extends State<CadastroUsuarioWidget> {
  CadastroUsuarioBloc cadastroUsuarioBloc = CadastroUsuarioBloc();

  void _alterar(CadastroUsuarioModel cadastroUsuarioModel) {
    open(context, CadastroUsuarioFormWidget(cadastroUsuarioModel));
  }

  void _excluir(CadastroUsuarioModel cadastroUsuarioModel) async {
    //await cadastroUsuarioBloc.delete(cadastroUsuarioModel);
  }

  _body(List<CadastroUsuarioModel>? cadastroUsuarioModel) {
    List<Widget> items = [];

    if (cadastroUsuarioModel != null) {
      for (int x = 0; x < cadastroUsuarioModel.length; x++) {
        items.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(cadastroUsuarioModel[x].nome.toString()),
              Row(
                children: [
                  ElevatedButton(onPressed: () => _alterar(cadastroUsuarioModel[x]), child: const Icon(Icons.edit)),
                  const SizedBox(
                    width: 8.0,
                  ),
                  ElevatedButton(
                    onPressed: () => _excluir(cadastroUsuarioModel[x]),
                    child: const Icon(Icons.delete),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // background
                      onPrimary: Colors.white, // foreground
                    ),
                  ),
                ],
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
        title: const Text(usuariosAprovados),
        backgroundColor: Colors.redAccent,
      ),
      body: StreamBuilder(
        stream: cadastroUsuarioBloc.dataOut,
        builder: (BuildContext context, AsyncSnapshot<List<CadastroUsuarioModel>> snapshot) {
          if (snapshot.hasData) {
            return RefreshIndicator(
              child: _body(snapshot.data),
              onRefresh: cadastroUsuarioBloc.load,
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
    cadastroUsuarioBloc.dispose();
    super.dispose();
  }
}
