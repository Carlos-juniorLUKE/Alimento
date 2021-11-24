import 'alimento.dart';

class Industrializado extends Alimento {
  Industrializado(
    String codigo,
    List<String> nome,
    List<String> ingles,
    String cientifico,
    String grupo,
    this.marcaDoFabricante,
  ) : super(codigo, nome, ingles, cientifico, grupo);

  final String marcaDoFabricante;

  @override
  String toString() {
    return "${super.toString()} | Marca do fabricante: ${this.marcaDoFabricante}";
  }
}