import 'package:flutter/material.dart';
import 'package:simulador_de_corrida/classes/tipos_de_veiculos/motocicleta.dart';
import 'package:simulador_de_corrida/classes/tipos_de_veiculos/veiculo_motorizado.dart';
import 'package:simulador_de_corrida/pages/home_page.dart';

import 'classes/tipos_de_veiculos/bicicleta.dart';
import 'classes/tipos_de_veiculos/carro_esportivo.dart';
import 'classes/tipos_de_veiculos/carro_passeio.dart';
import 'classes/tipos_de_veiculos/veiculo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
