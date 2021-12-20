class Transferencia {
  Transferencia(this._valor, this._numeroConta);

  final double _valor;
  final int _numeroConta;

  double get valor => _valor;
  int get numeroConta => _numeroConta;

  @override
  String toString() {
    return 'Transferencia{valor: $_valor, numeroConta: $_numeroConta}';
  }
}
