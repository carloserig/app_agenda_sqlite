import 'package:flutter/material.dart';

class EditarContato extends StatefulWidget {

  const EditarContato({ super.key });

  @override
  State<EditarContato> createState() => _EditarContatoState();
}

class _EditarContatoState extends State<EditarContato> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Editar Contato'),),
           body: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Esta é a terceira tela'),
                  ElevatedButton(onPressed: () {
                    Navigator.of(context).pop();
                  }, child: Text('Voltar para a segunda tela'))
                ],
              ),
            ),
           ),
       );
  }
}