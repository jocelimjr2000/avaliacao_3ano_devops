import 'package:cadusuario_frontend/app/constants.dart';
import 'package:cadusuario_frontend/functions/open.dart';
import 'package:cadusuario_frontend/model/cadastro_usuario_model.dart';
import 'package:cadusuario_frontend/screens/cadastro_alterar_status_reprovado_widget.dart';
import 'package:cadusuario_frontend/screens/cadastro_alterar_status_widget.dart';
import 'package:cadusuario_frontend/screens/cadastro_login_form_widget.dart';
import 'package:cadusuario_frontend/screens/cadastro_usuario_form_widget.dart';
import 'package:cadusuario_frontend/screens/cadastro_usuario_widget.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Image.asset(
            "images/btm.jpg",
          ),
          const Text('Início'),
        ],
      ), //todo inserir home
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/btm.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: null,
            ),
            Card(
              color: Colors.redAccent,
              child: ListTile(
                title: const Text(login),
                onTap: () => {
                  Navigator.pop(context),
                  open(context, const CadastroLoginFormWidget()),
                },
              ),
            ),
            Card(
              color: Colors.redAccent,
              child: ListTile(
                title: const Text(cadastrarNovoUsuario),
                onTap: () => {
                  Navigator.pop(context),
                  open(context, CadastroUsuarioFormWidget(CadastroUsuarioModel())),
                },
              ),
            ),
            Card(
              color: Colors.redAccent,
              child: ListTile(
                title: const Text(usuariosAprovados),
                onTap: () => {
                  Navigator.pop(context),
                  open(context, const CadastroUsuarioWidget()),
                },
              ),
            ),
            Card(
              color: Colors.redAccent,
              child: ListTile(
                title: const Text(alterarStatus),
                onTap: () => {
                  Navigator.pop(context),
                  open(context, const CadastroAlterarStatusWidget()),
                },
              ),
            ),
            Card(
              color: Colors.redAccent,
              child: ListTile(
                title: const Text(pesquisarUsuario),
                onTap: () => {
                  Navigator.pop(context),
                  //open(context, CadastroPesquisarUsuarioWidget()),
                },
              ),
            ),
            Card(
              color: Colors.redAccent,
              child: ListTile(
                title: const Text(usuariosReprovados),
                onTap: () => {
                  Navigator.pop(context),
                  open(context, const CadastroAlterarStatusReprovadoWidget()),
                },
              ),
            ),
            Card(
              color: Colors.redAccent,
              child: ListTile(
                title: const Text('Movimentação de estoque'),
                onTap: () => {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
