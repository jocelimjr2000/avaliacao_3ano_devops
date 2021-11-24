import 'package:cadusuario_frontend/app/constants.dart';
import 'package:cadusuario_frontend/bloc/cadastro_usuario_bloc.dart';
import 'package:cadusuario_frontend/model/cadastro_usuario_model.dart';
import 'package:flutter/material.dart';

class CadastroUsuarioFormWidget extends StatefulWidget {
  final CadastroUsuarioModel cadastroUsuarioModel;

  const CadastroUsuarioFormWidget(this.cadastroUsuarioModel, {Key? key}) : super(key: key);

  @override
  _CadastroUsuarioFormWidgetState createState() => _CadastroUsuarioFormWidgetState();
}

//Validação
String _validar(String? value) {
  if (value != null) {
    return '';
  }
  return valorIncorreto;
}

class _CadastroUsuarioFormWidgetState extends State<CadastroUsuarioFormWidget> {
  final _formKey = GlobalKey<FormState>();

  final CadastroUsuarioBloc _cadastroUsuarioBloc = CadastroUsuarioBloc();

  TextEditingController? _cpfController;
  TextEditingController? _nomeController;
  TextEditingController? _dtNascimentoController;
  TextEditingController? _emailController;
  TextEditingController? _nivelController;

  bool _novo = false;

  @override
  void initState() {
    super.initState();

    _cpfController = TextEditingController(text: widget.cadastroUsuarioModel.cpf);
    _nomeController = TextEditingController(text: widget.cadastroUsuarioModel.nome);
    _dtNascimentoController = TextEditingController(text: widget.cadastroUsuarioModel.dtNascimento);
    _emailController = TextEditingController(text: widget.cadastroUsuarioModel.email);
    _nivelController = TextEditingController(text: widget.cadastroUsuarioModel.nivel.toString());

    if(widget.cadastroUsuarioModel.cpf == ''){
      _novo = true;
    }
  }

  _salvar() async {
    if (_formKey.currentState!.validate()) {
      widget.cadastroUsuarioModel.cpf = _cpfController!.text;
      widget.cadastroUsuarioModel.nome = _nomeController!.text;
      widget.cadastroUsuarioModel.dtNascimento = _dtNascimentoController!.text;
      widget.cadastroUsuarioModel.email = _emailController!.text;
      widget.cadastroUsuarioModel.nivel = int.parse(_nivelController!.text);

      if (_novo) {
        await _cadastroUsuarioBloc.save(widget.cadastroUsuarioModel);
        Navigator.pop(context);
      } else {
        await _cadastroUsuarioBloc.update(widget.cadastroUsuarioModel);
        Navigator.pop(context);
      }
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(salvando)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(falha)));
    }
  }

  _body() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextFormField(controller: _cpfController, decoration: const InputDecoration(hintText: cpf), maxLength: 11, validator: _validar),
              TextFormField(controller: _nomeController, decoration: const InputDecoration(hintText: nome), maxLength: 200, validator: _validar),
              TextFormField(controller: _dtNascimentoController, decoration: const InputDecoration(hintText: dataNascimento), maxLength: 40, validator: _validar),
              TextFormField(controller: _emailController, decoration: const InputDecoration(hintText: email), keyboardType: TextInputType.emailAddress, maxLength: 40, validator: _validar),
              TextFormField(controller: _nivelController, decoration: const InputDecoration(hintText: nivel), keyboardType: TextInputType.phone, maxLength: 1, validator: _validar),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () => _salvar(),
                  child: const Text(salvar),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(cadastroUsuario),
        backgroundColor: Colors.redAccent,
      ),
      body: _body(),
    );
  }

  @override
  void dispose() {
    _cadastroUsuarioBloc.dispose();

    _cpfController!.dispose();
    _nomeController!.dispose();
    _dtNascimentoController!.dispose();
    _emailController!.dispose();
    _nivelController!.dispose();

    super.dispose();
  }
}
