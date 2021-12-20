import 'package:flutter/material.dart';
import 'package:bytebank/screens/transferencia/lista.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  BytebankApp({Key? key}) : super(key: key);

  final ThemeData theme = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.green[900],
          secondary: Colors.blueAccent[700],
        ),
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSwatch(
      //     primarySwatch: Colors.green,
      //   ).copyWith(
      //     secondary: Colors.blueAccent[700],
      //   ), Utilizado pela Alura
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: Colors.blueAccent[700],
            )
        ),
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary ),
      ),
    home: ListaTransferencia(),
    );
  }
}
