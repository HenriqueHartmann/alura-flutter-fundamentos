import 'package:flutter/material.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';

const _tituloAppBar = 'Transferências';

class ListaTransferencia extends StatefulWidget {
  ListaTransferencia({Key? key}) : super(key: key);

  final List<Transferencia> _transferencias = []; // Or List.empty(growable: true);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];

          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const FormularioTransferencia();
          })).then((transferenciaRecebida) {
            if (transferenciaRecebida != null) {
              setState(() => widget._transferencias.add(transferenciaRecebida));
            }
          });
        },
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
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}