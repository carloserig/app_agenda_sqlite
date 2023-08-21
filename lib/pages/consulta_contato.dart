import 'dart:io';

import 'package:app_agenda/stores/contato_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ConsultaContato extends StatefulWidget {
  const ConsultaContato({super.key});

  @override
  State<ConsultaContato> createState() => _ConsultaContatoState();
}

class _ConsultaContatoState extends State<ConsultaContato> {
  final contatoStore = ContatoStore();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: contatoStore.buscarTodosContatos(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Cadastro de Contatos'),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Observer(builder: (_) {
                return ListView.builder(
                  itemCount: contatoStore.contatosList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Card(
                        elevation: 2,
                        shadowColor: Colors.grey,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 70.0,
                                height: 70.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: FileImage(File(contatoStore
                                          .contatosList[index].foto!)),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  contatoStore.contatosList[index].nome,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  contatoStore.contatosList[index].celular,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontStyle: FontStyle.italic),
                                ),
                                Text(
                                  contatoStore.contatosList[index].email,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      onLongPress: () async {
                        await _AlertExcluir(context, index);
                      },
                      onTap: () async {},
                    );
                  },
                );
              }),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () async {
                await Navigator.of(context).pushNamed('/novo');
                await contatoStore.buscarTodosContatos();
              },
              label: const Text('Novo Contato'),
              icon: const Icon(Icons.save),
              backgroundColor: Colors.blue,
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Erro ao obter dados'),
                    ElevatedButton(
                        onPressed: () {
                          contatoStore.buscarTodosContatos();
                        },
                        child: const Text('Tentar novamente'))
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container(
            color: Colors.blue,
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          );
        }
      }),
    );
  }

  Future<void> _AlertExcluir(BuildContext context, int index) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Tem certeza que deseja excluir o registro?'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Center(),
                ],
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Observer(builder: (_) {
                  return ElevatedButton(
                    child: contatoStore.loading
                        ? Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, bottom: 20.0),
                            child: const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            ),
                          )
                        : Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, bottom: 20.0),
                            child: const Text(
                              'Excluir',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                    onPressed: () async {
                      await contatoStore
                          .deletarContato(contatoStore.contatosList[index].id!);
                      Navigator.pop(context);
                      await contatoStore.buscarTodosContatos();
                    },
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Observer(builder: (_) {
                  return ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: const Text(
                        'Cancelar',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  );
                }),
              ),
            ],
          );
        });
  }
}
