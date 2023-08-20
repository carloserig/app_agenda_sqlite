import 'package:app_agenda/helpers/extensions.dart';
import 'package:app_agenda/models/contato.dart';
import 'package:app_agenda/repositories/contato_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'contato_store.g.dart';

class ContatoStore = ContatoStoreBase with _$ContatoStore;

abstract class ContatoStoreBase with Store {
  @observable
  int? id;
  @action
  void setId(int value) => id = value;
  
  @observable
  String nome = '';
  @action
  void setNome(String value) => nome = value;
  @computed
  bool get nomeValid => nome.isNotEmpty && nome.length > 5;
  String? get nomeError {
    if (nomeValid) {
      return null;
    } else if (nome.isEmpty) {
      return 'Campo Obrigatório';
    } else {
      return 'Nome inválido';
    }
  }

  @observable
  String celular = '';
  @action
  void setCelular(String value) => celular = value;
  @computed
  bool get celularValid => celular.isNotEmpty && celular.length > 14;
  String? get celularError {
    if (celularValid) {
      return null;
    } else if (celular.isEmpty) {
      return 'Campo Obrigatório';
    } else {
      return 'Celular inválido';
    }
  }

  @observable
  String email = '';
  @action
  void setEmail(String value) => email = value;
  @computed
  bool get emailValid => email.isNotEmpty && email.isEmailValid();
  String? get emailError {
    if (emailValid) {
      return null;
    } else if (email.isEmpty) {
      return 'Campo Obrigatório';
    } else {
      return 'Email inválido';
    }
  }

  @observable
  String foto = '';
  @action
  void setFoto(String value) => foto = value;
  @computed
  bool get fotoValid => foto.isNotEmpty;

  @observable
  String? notification;

  @observable
  bool loading = false;
  @action
  void setLoading(bool value) =>loading = value;

  @action
  Future<void> salvarContato() async {
    final contato = Contato(
      nome: nome,
      celular: celular,
      email: email,
      foto: foto
    );
    loading = true;
    try {
      var result = await ContatoRepository().addContato(contato);
      notification = 'Contato cadastrado com sucesso';
      await Future.delayed(const Duration(seconds: 2));
      notification = null;
    } catch (e) {
      notification = e.toString();
    }
    loading = false;    
  }

  @action
  Future<void> atualizarContato() async {
    final contato = Contato(
      id: id,
      nome: nome,
      celular: celular,
      email: email,
      foto: foto
    );
    loading = true;
    try {
      var result = await ContatoRepository().updateContato(contato);
      notification = 'Contato atualizado com sucesso';
      await Future.delayed(const Duration(seconds: 2));
      notification = null;
    } catch (e) {
      notification = e.toString();
    }
    loading = false;    
  }

  @action
  Future<void> deletarContato(int id) async {
    loading = true;
    try {
      var result = await ContatoRepository().deletarContato(id);
      notification = '$result deletado com sucesso';
      await Future.delayed(const Duration(seconds: 2));
      notification = null;
    } catch (e) {
      notification = e.toString();
    }
    loading = false;    
  }

  @observable
  List<Contato> contatosList = [];

  @action
  Future<void> buscarTodosContatos() async {
    contatosList = [];
    loading = true;
    try {
      notification = 'Buscando contatos';
      await Future.delayed(const Duration(seconds: 2));
      contatosList = await ContatoRepository().buscarTodosContatos();
      notification = null;
    } catch (e) {
      notification = e.toString();
    }
    loading = false;    
  }
}