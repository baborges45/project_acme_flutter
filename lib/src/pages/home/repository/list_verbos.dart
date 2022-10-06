class ListVerbos {
  ListVerbos.fromJson(Map<String, dynamic> json) {
    verbos = json['verbos'];
  }
  ListVerbos({
    this.verbos,
  });
  List<dynamic>? verbos;
}
