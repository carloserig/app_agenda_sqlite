// ignore_for_file: public_member_api_docs, sort_constructors_first

class Contato {
  int? id;
  String nome;
  String celular;
  String email;
  String foto;

  Contato({
    this.id,
    required this.nome,
    required this.celular,
    required this.email,
    required this.foto,
  });

}
