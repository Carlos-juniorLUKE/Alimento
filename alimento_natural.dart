import 'alimento.dart';

class Natural extends Alimento {
  Natural(
    String codigo,
    List<String> nome,
    List<String> ingles,
    String cientifico,
    String grupo,
    this.validade,
  ) : super(codigo, nome, ingles, cientifico, grupo);

  final DateTime validade;

  @override
  String toString() {
    return '${super.toString()} | Validade: $validade';
  }
}