import 'package:app_agenda/pages/consulta_contato.dart';
import 'package:flutter/material.dart';

class Contato extends StatefulWidget {

  const Contato({ super.key });

  @override
  State<Contato> createState() => _ContatoState();
}

class _ContatoState extends State<Contato> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Contato'),),
           body: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                ],
              ),
            ),
           ),
       );
  }
}