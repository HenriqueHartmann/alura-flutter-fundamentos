import 'package:flutter/material.dart';
import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';

const _tituloAppBar = 'Criando Transferencia';
const _editorNumeroConta = ['Número da conta:', '0000'];
const _editorValor = ['Valor', '0.00'];
const _textButton = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  const FormularioTransferencia({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text(_tituloAppBar)),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                  controlador: _controladorCampoNumeroConta,
                  rotulo: _editorNumeroConta[0],
                  dica: _editorNumeroConta[1]
              ),
              Editor(
                  controlador: _controladorCampoValor,
                  rotulo: _editorValor[0],
                  dica: _editorValor[1],
                  icone: Icons.monetization_on
              ),
              ElevatedButton(
                child: const Text(_textButton),
                onPressed: () => _criaTransferencia(context),
              ),
            ],
          ),
        )
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);

    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}