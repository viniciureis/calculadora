import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  String numero = '0';
  double primeironumero = 0;
  String operacao = '';
  String resultado = '';

  void calcular(String tecla) {
    switch (tecla) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case ',':
        setState(() {
          if (resultado.isNotEmpty) {
            numero = tecla;
            resultado = '';
          } else if (numero != '0') {
            numero += tecla;
          } else {
            numero = tecla;
          }
          numero = numero.replaceAll(',', '.');
          if (numero.contains('.')) {
            //double numeroDouble = double.parse(numero);
            // numero = numeroDouble.toString();
          } else {
            int numeroInt = int.parse(numero);
            numero = numeroInt.toString();
          }
          numero = numero.replaceAll('.', ',');
        });
        break;
      case '+':
      case '-':
      case 'x':
      case '/':
        operacao = tecla;
        primeironumero = double.parse(numero);
        numero = '0';
        setState(() {
          resultado = '$primeironumero $operacao ';
        });
        break;
      case '=':
        if (operacao == '+') {
          double resultadoDouble = primeironumero + int.parse(numero);
          resultado = '$primeironumero + $numero = $resultadoDouble';
        } else if (operacao == '-') {
          double resultadoDouble = primeironumero - int.parse(numero);
          resultado = '$primeironumero - $numero = $resultadoDouble';
        } else if (operacao == 'x') {
          double resultadoDouble = primeironumero * int.parse(numero);
          resultado = '$primeironumero x $numero = $resultadoDouble';
        } else if (operacao == '/') {
          double resultadoDouble = primeironumero / int.parse(numero);
          resultado = '$primeironumero / $numero = $resultadoDouble';
        }
        setState(() {
          numero = resultado;
          operacao = '';
        });
        break;
      case 'AC':
        setState(() {
          numero = '0';
          primeironumero = 0;
          operacao = '';
          resultado = '';
        });
        break;
      default:
        numero += tecla;
        break;
    }
  }

  // Função para criar botões de dígitos
  Widget buildDigitoButton(String digito) {
    return GestureDetector(
      onTap: () {
        calcular(digito);
      },
      child: Text(
        digito,
        style: TextStyle(fontSize: 48),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Calculadora'),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '$primeironumero $operacao $numero',
                  style: const TextStyle(fontSize: 72),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildDigitoButton('AC'),
                Text(''),
                Text(''),
                buildDigitoButton('/'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildDigitoButton('7'),
                buildDigitoButton('8'),
                buildDigitoButton('9'),
                buildDigitoButton('x'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildDigitoButton('4'),
                buildDigitoButton('5'),
                buildDigitoButton('6'),
                buildDigitoButton('-'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildDigitoButton('1'),
                buildDigitoButton('2'),
                buildDigitoButton('3'),
                buildDigitoButton('+'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildDigitoButton('0'),
                buildDigitoButton(','),
                buildDigitoButton('='),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
