import 'package:flutter/material.dart';

class ConsultaContato extends StatefulWidget {

  const ConsultaContato({ super.key });

  @override
  State<ConsultaContato> createState() => _ConsultaContatoState();
}

class _ConsultaContatoState extends State<ConsultaContato> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Consulta Consulta Contatos'),),
           body: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Esta é a segunda Tela'),
                  ElevatedButton(onPressed: () async {
                    await Navigator.of(context).pushNamed('/editar');
                  }, child: Text('Ir para a Terceira Tela')
                  ),
                  ElevatedButton(onPressed: () {
                    Navigator.of(context).pop();
                  }, child: Text('Voltar para a Primeira Tela')
                  ),
                  
                ],
              ),
            ),
           ),
       );
  }
}