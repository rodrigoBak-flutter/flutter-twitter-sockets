class Twitt {
  String id;
  String usuario;
  String texto;

  Twitt({
    this.id,
    this.usuario,
    this.texto,
  });

  factory Twitt.fromMap(Map<String, dynamic> obj) {
    return Twitt(
      id: obj['id'],
      usuario: obj['usuario'],
      texto: obj['texto'],
    );
  }
}
