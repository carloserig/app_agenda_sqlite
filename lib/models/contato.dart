import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Contato {
  int? id;
  String nome;
  String celular;
  String email;
  String? foto;

  Contato({
    this.id,
    required this.nome,
    required this.celular,
    required this.email,
    this.foto,
  });


  @override
  String toString() {
    return 'Contato(id: $id, nome: $nome, celular: $celular, email: $email, foto: $foto)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'celular': celular,
      'email': email,
      'foto': foto,
    };
  }

  factory Contato.fromMap(Map<String, dynamic> map) {
    return Contato(
      id: map['id'] != null ? map['id'] as int : null,
      nome: map['nome'] as String,
      celular: map['celular'] as String,
      email: map['email'] as String,
      foto: map['foto'] != null ? map['foto'] as String : null,
    );
  }

}
