class Alimento {
  Alimento(this.codigo, this.nome, this.ingles, this.cientifico, this.grupo);

  String codigo;
  List<String> nome;
  List<String> ingles;
  String cientifico;
  String grupo;

  Alimento.fromCSV(String rowCSV) {
    final columns = rowCSV.split(',');
    codigo = columns[0];
    nome = columns[1].replaceAll('[', '').replaceAll(']', '').split(',');
    cientifico = columns[2];
    ingles = columns[3].replaceAll('[', '').replaceAll(']', '').split(',');
    grupo = columns[4];
  }

  @override
  String toString() {
    return "Codigo: ${this.codigo} | Nome: ${this.nome} | Nome Cientifico: ${this.cientifico} | Inglês: ${this.ingles} | Grupo:${this.grupo}";
  }

  String toCSV() {
    return '$codigo, $nome, $cientifico, $ingles, $grupo';
  }
}