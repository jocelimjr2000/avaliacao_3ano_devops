import 'package:cadusuario_frontend/app/constants.dart';
import 'package:cadusuario_frontend/bloc/cadastro_alterar_status_bloc.dart';
import 'package:cadusuario_frontend/functions/open.dart';
import 'package:cadusuario_frontend/model/cadastro_alterar_status_model.dart';
import 'package:cadusuario_frontend/model/cadastro_usuario_model.dart';
import 'package:cadusuario_frontend/screens/cadastro_alterar_status_form_widget.dart';
import 'package:flutter/material.dart';

class CadastroAlterarStatusWidget extends StatefulWidget {
  const CadastroAlterarStatusWidget({Key? key}) : super(key: key);

  @override
  _CadastroAlterarStatusWidgetState createState() => _CadastroAlterarStatusWidgetState();
}

class _CadastroAlterarStatusWidgetState extends State<CadastroAlterarStatusWidget> {

  CadastroAlterarStatusBloc cadastroAlterarStatusBloc = CadastroAlterarStatusBloc();

  void _alterar(CadastroUsuarioModel cadastroUsuarioModel) {
    CadastroAlterarStatusModel cadastroAlterarStatusModel = CadastroAlterarStatusModel();
    cadastroAlterarStatusModel.cpf = cadastroUsuarioModel.cpf;
    cadastroAlterarStatusModel.aprovar = false;

    open(context, CadastroAlterarStatusFormWidget(cadastroAlterarStatusModel));
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
        title: const Text(alterarStatus),
        backgroundColor: Colors.redAccent,
      ),
      body: StreamBuilder(
        stream: cadastroAlterarStatusBloc.dataOut,
        builder: (BuildContext context, AsyncSnapshot<List<CadastroUsuarioModel>> snapshot) {
          if (snapshot.hasData) {
            return RefreshIndicator(
              child: _body(snapshot.data),
              onRefresh: cadastroAlterarStatusBloc.load,
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
    cadastroAlterarStatusBloc.dispose();
    super.dispose();
  }
}
