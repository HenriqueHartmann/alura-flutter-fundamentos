import 'package:flutter/material.dart';

void main() {
  runApp(const BytebankApp());
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  FormularioTransferencia({Key? key}) : super(key: key);

  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criando Transferencia')),
      body: Column(
        children: <Widget>[
          Editor(
              controlador: _controladorCampoNumeroConta,
              rotulo: 'Número da conta:',
              dica: '0000'
          ),
          Editor(
            controlador: _controladorCampoValor,
            rotulo: 'Valor',
            dica: '0.00',
            icone: Icons.monetization_on
          ),
          ElevatedButton(
            child: const Text("Confirmar"),
            onPressed: () => _criaTransferencia(context),
          ),
        ],
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

class Editor extends StatelessWidget {
   const Editor({Key? key,
    required this.controlador,
    required this.rotulo,
    required this.dica,
    this.icone
  }): super(key: key);


  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData? icone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: const TextStyle(
            fontSize: 24.0
        ),
        decoration: InputDecoration(
            icon: icone != null ? Icon(icone) : null,
            labelText: rotulo,
            hintText: dica
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ListaTransferencia extends StatelessWidget {
  ListaTransferencia({Key? key}) : super(key: key);

  final List<Transferencia> _transferencias = List.empty(growable: true); // Ou []

  @override
  Widget build(BuildContext context) {
    _transferencias.add(Transferencia(100.0, 1000));
    _transferencias.add(Transferencia(100.0, 1000));
    _transferencias.add(Transferencia(100.0, 1000));
    _transferencias.add(Transferencia(100.0, 1000));

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferências'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: _transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = _transferencias[indice];

          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transferencia?> future = Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          future.then((transferenciaRecebida) {
            debugPrint('$transferenciaRecebida');
            if (transferenciaRecebida != null) {
              _transferencias.add(transferenciaRecebida);
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  const ItemTransferencia(this._transferencia, {Key? key}) : super(key: key);

  final Transferencia _transferencia;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_transferencia._valor.toString()),
        subtitle: Text(_transferencia._numeroConta.toString()),
      ),
    );
  }

}

class Transferencia {
  Transferencia(this._valor, this._numeroConta);

  final double _valor;
  final int _numeroConta;

  @override
  String toString() {
    return 'Transferencia{valor: $_valor, numeroConta: $_numeroConta}';
  }
}
