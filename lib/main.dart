import 'package:app_agenda/pages/consulta_contato.dart';
import 'package:app_agenda/pages/contato.dart';
import 'package:app_agenda/pages/editar_contato.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: const Contato(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(_) => const Contato(), 
        '/consulta':(_) => const ConsultaContato(),
        '/editar':(_) => const EditarContato()
      }
    );
  }
}
