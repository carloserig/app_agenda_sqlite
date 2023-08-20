// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contato_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ContatoStore on ContatoStoreBase, Store {
  Computed<bool>? _$nomeValidComputed;

  @override
  bool get nomeValid =>
      (_$nomeValidComputed ??= Computed<bool>(() => super.nomeValid,
              name: 'ContatoStoreBase.nomeValid'))
          .value;
  Computed<bool>? _$celularValidComputed;

  @override
  bool get celularValid =>
      (_$celularValidComputed ??= Computed<bool>(() => super.celularValid,
              name: 'ContatoStoreBase.celularValid'))
          .value;
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: 'ContatoStoreBase.emailValid'))
          .value;
  Computed<bool>? _$fotoValidComputed;

  @override
  bool get fotoValid =>
      (_$fotoValidComputed ??= Computed<bool>(() => super.fotoValid,
              name: 'ContatoStoreBase.fotoValid'))
          .value;

  late final _$idAtom = Atom(name: 'ContatoStoreBase.id', context: context);

  @override
  int? get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int? value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$nomeAtom = Atom(name: 'ContatoStoreBase.nome', context: context);

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  late final _$celularAtom =
      Atom(name: 'ContatoStoreBase.celular', context: context);

  @override
  String get celular {
    _$celularAtom.reportRead();
    return super.celular;
  }

  @override
  set celular(String value) {
    _$celularAtom.reportWrite(value, super.celular, () {
      super.celular = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'ContatoStoreBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$fotoAtom = Atom(name: 'ContatoStoreBase.foto', context: context);

  @override
  String get foto {
    _$fotoAtom.reportRead();
    return super.foto;
  }

  @override
  set foto(String value) {
    _$fotoAtom.reportWrite(value, super.foto, () {
      super.foto = value;
    });
  }

  late final _$notificationAtom =
      Atom(name: 'ContatoStoreBase.notification', context: context);

  @override
  String? get notification {
    _$notificationAtom.reportRead();
    return super.notification;
  }

  @override
  set notification(String? value) {
    _$notificationAtom.reportWrite(value, super.notification, () {
      super.notification = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'ContatoStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$contatosListAtom =
      Atom(name: 'ContatoStoreBase.contatosList', context: context);

  @override
  List<Contato> get contatosList {
    _$contatosListAtom.reportRead();
    return super.contatosList;
  }

  @override
  set contatosList(List<Contato> value) {
    _$contatosListAtom.reportWrite(value, super.contatosList, () {
      super.contatosList = value;
    });
  }

  late final _$salvarContatoAsyncAction =
      AsyncAction('ContatoStoreBase.salvarContato', context: context);

  @override
  Future<void> salvarContato() {
    return _$salvarContatoAsyncAction.run(() => super.salvarContato());
  }

  late final _$atualizarContatoAsyncAction =
      AsyncAction('ContatoStoreBase.atualizarContato', context: context);

  @override
  Future<void> atualizarContato() {
    return _$atualizarContatoAsyncAction.run(() => super.atualizarContato());
  }

  late final _$deletarContatoAsyncAction =
      AsyncAction('ContatoStoreBase.deletarContato', context: context);

  @override
  Future<void> deletarContato(int id) {
    return _$deletarContatoAsyncAction.run(() => super.deletarContato(id));
  }

  late final _$buscarTodosContatosAsyncAction =
      AsyncAction('ContatoStoreBase.buscarTodosContatos', context: context);

  @override
  Future<void> buscarTodosContatos() {
    return _$buscarTodosContatosAsyncAction
        .run(() => super.buscarTodosContatos());
  }

  late final _$ContatoStoreBaseActionController =
      ActionController(name: 'ContatoStoreBase', context: context);

  @override
  void setId(int value) {
    final _$actionInfo = _$ContatoStoreBaseActionController.startAction(
        name: 'ContatoStoreBase.setId');
    try {
      return super.setId(value);
    } finally {
      _$ContatoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNome(String value) {
    final _$actionInfo = _$ContatoStoreBaseActionController.startAction(
        name: 'ContatoStoreBase.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$ContatoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCelular(String value) {
    final _$actionInfo = _$ContatoStoreBaseActionController.startAction(
        name: 'ContatoStoreBase.setCelular');
    try {
      return super.setCelular(value);
    } finally {
      _$ContatoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$ContatoStoreBaseActionController.startAction(
        name: 'ContatoStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$ContatoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFoto(String value) {
    final _$actionInfo = _$ContatoStoreBaseActionController.startAction(
        name: 'ContatoStoreBase.setFoto');
    try {
      return super.setFoto(value);
    } finally {
      _$ContatoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$ContatoStoreBaseActionController.startAction(
        name: 'ContatoStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$ContatoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
nome: ${nome},
celular: ${celular},
email: ${email},
foto: ${foto},
notification: ${notification},
loading: ${loading},
contatosList: ${contatosList},
nomeValid: ${nomeValid},
celularValid: ${celularValid},
emailValid: ${emailValid},
fotoValid: ${fotoValid}
    ''';
  }
}
