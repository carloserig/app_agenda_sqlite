import 'dart:io';

import 'package:app_agenda/components/error_box.dart';
import 'package:app_agenda/components/titulo_subtitulo.dart';
import 'package:app_agenda/stores/contato_store.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';

class Contato extends StatefulWidget {
  const Contato({super.key});

  @override
  State<Contato> createState() => _ContatoState();
}

class _ContatoState extends State<Contato> {
  final contatoStore = ContatoStore();

  ImagePicker picker = ImagePicker();
  File? imagemSelecionada;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Contato'),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Observer(
              builder: (_) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ErrorBox(
                        message: contatoStore.notification,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          contatoStore.foto.isEmpty
                              ? Container(
                                  width: 140.0,
                                  height: 140.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/person.png"),
                                        fit: BoxFit.cover),
                                  ),
                                )
                              : Container(
                                  width: 140.0,
                                  height: 140.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image:
                                            FileImage(File(contatoStore.foto)),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: _fotoCamera,
                            icon: const Icon(Icons.camera_alt),
                          ),
                          IconButton(
                            onPressed: _fotoGaleria,
                            icon: Icon(Icons.attach_file),
                          ),
                        ],
                      ),
                      TituloSubtitulo(
                          titulo: 'Nome', subtitulo: 'Digite o nome completo'),
                      TextField(
                          enabled: !contatoStore.loading,
                          cursorColor: Colors.blue,
                          maxLines: 1,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            errorText: contatoStore.nomeError,
                          ),
                          onChanged: (value) {
                            contatoStore.setNome(value);
                          }),
                      TituloSubtitulo(
                          titulo: 'Celular', subtitulo: 'Informe o nº Celular'),
                      TextField(
                          enabled: !contatoStore.loading,
                          cursorColor: Colors.blue,
                          maxLines: 1,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              hintText: '(99) 99999-9999',
                              errorText: contatoStore.celularError),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            TelefoneInputFormatter(),
                          ],
                          onChanged: (value) {
                            contatoStore.setCelular(value);
                          }),
                      TituloSubtitulo(
                          titulo: 'E-mail',
                          subtitulo: 'Informe o melhor e-mail'),
                      TextField(
                          enabled: !contatoStore.loading,
                          cursorColor: Colors.blue,
                          maxLines: 1,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            errorText: contatoStore.emailError,
                          ),
                          onChanged: (value) {
                            contatoStore.setEmail(value);
                          }),
                      Padding(
                        padding: const EdgeInsets.only(left: 3, top: 20),
                        child: ElevatedButton(
                            child: contatoStore.loading
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16.0, bottom: 16.0),
                                    child: const CircularProgressIndicator(
                                      valueColor:
                                          AlwaysStoppedAnimation(Colors.white),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16.0, bottom: 16.0),
                                    child: const Text(
                                      'Salvar',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                            onPressed: () async {
                              if (contatoStore.nomeValid &&
                                  contatoStore.celularValid &&
                                  contatoStore.emailValid &&
                                  contatoStore.fotoValid) {
                                await contatoStore.salvarContato();
                                Navigator.of(context).pop();
                              } else {
                                contatoStore.notification =
                                    'Dados do formulário inconsistentes!';
                                await Future.delayed(
                                    const Duration(seconds: 2));
                              }
                            }),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  _fotoGaleria() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    imagemSelecionada = File(image.path);
    contatoStore.foto = imagemSelecionada!.path;
    print('imagem --> ${imagemSelecionada!.path}');
  }

  _fotoCamera() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return;
    imagemSelecionada = File(image.path);
    contatoStore.foto = imagemSelecionada!.path;
    print('imagem --> ${imagemSelecionada!.path}');
  }
}
