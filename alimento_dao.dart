import 'dart:io';
import 'package:alimentos_flutter/alimento.dart';

class AlimentoDAO {
  bool create(Alimento alimento) {
    try {
      final file = File('arquivo.csv');
      String contents;
      if (file.existsSync()) {
        final dadosSalvos = file.readAsStringSync();
        contents = dadosSalvos + '\n' + alimento.toCSV();
      } else {
        contents = alimento.toCSV();
      }
      file.writeAsStringSync(contents);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
  
  List<Alimento> listAll() {
    final alimentos = <Alimento>[];
    final file = File('arquivo.csv');
    final dadosSalvos = file.readAsLinesSync();
    for (var row in dadosSalvos) {
      final novoAlimento = Alimento.fromCSV(row);
      alimentos.add(novoAlimento);
    }

    return alimentos;
  }
 
  Alimento getByCod(String codigo) {
    final file = File('arquivo.csv');
    final dadosSalvos = file.readAsLinesSync();
    for (var item in dadosSalvos) {
      final columns = item.split(',');
      if (columns[0] == codigo) return Alimento.fromCSV(item);
    }

    return null;
  }

  Alimento update(Alimento alimento) {
    final file = File('arquivo.csv');
    final dadosSalvos = file.readAsLinesSync();
    for (var i = 0; i < dadosSalvos.length; i++) {
      final row = dadosSalvos[i];
      final columns = row.split(',');
      if (columns[0] == alimento.codigo) {
        dadosSalvos[i] = alimento.toCSV();
      }
    }
    String contents = dadosSalvos.join("\n");
    file.writeAsStringSync(contents);
    return alimento;
  }

  bool delete(String codigo) {
    final file = File('arquivo.csv');
    final dadosSalvos = file.readAsLinesSync();
    for (var i = 0; i < dadosSalvos.length; i++) {
      final row = dadosSalvos[i];
      final columns = row.split(',');
      if (columns[0] == codigo) {
        dadosSalvos.remove(row);
      }
    }
    String contents = dadosSalvos.join("\n");
    file.writeAsStringSync(contents);
    return true;
  }
}