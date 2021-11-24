import 'dart:io';
import 'package:alimentos_flutter/alimento.dart';
import 'package:alimentos_flutter/alimento_dao.dart';
import 'package:alimentos_flutter/alimento_industrializado.dart';
import 'package:alimentos_flutter/alimento_natural.dart';

int showMainMenu() {
  print("++++MENU++++");
  print("1 - Para adicionar alimento");
  print("2 - Para ver lista de alimentos cadastrados");
  print("3 - Atualizar Alimento");
  print("4 - Deletear Alimento");
  print("0 - Finalizar programa");
  int option = int.parse(stdin.readLineSync());
  return option;
}

int showCreateMenu() {
  print("++++MENU DE CRIAÇÃO++++");
  print("1 - Cadastrar alimento industrializado");
  print("2 - Cadastrar alimento natural");
  print("0 - Voltar");
  int option = int.parse(stdin.readLineSync());
  return option;
}

int showUpdateMenu() {
  print("++++MENU DE ATUALIZAÇÃO++++");
  print("++++Qual campo deseja alterar?++++");
  print("1 - nome");
  print("2 - nome inglês");
  print("3 - nome cientifico");
  print("4 - grupo");
  int option = int.parse(stdin.readLineSync());
  return option;
}

int showDeleteMenu() {
  print("++++MENU DELETAR++++");
  print("++++Qual campo deseja Deletar?++++");
  print("1 - nome");
  print("2 - nome inglês");
  print("3 - nome cientifico");
  print("3 - grupo");
  int option = int.parse(stdin.readLineSync());
  return option;
}

Alimento createAlimento() {
  int option = showCreateMenu();

  print("Digite o codigo do alimento");
  String codigo = stdin.readLineSync();

  print("Digite o nome");
  String nome = stdin.readLineSync();

  print("Digite o nome científico");
  String cientifico = stdin.readLineSync();

  print("Digite o nome em inglês");
  String ingles = stdin.readLineSync();

  print("Digite o grupo");
  String grupo = stdin.readLineSync();

  switch (option) {
    case 1:
      print("Digite a marca do fabricante");
      String fabricante = stdin.readLineSync();

      return Industrializado(
        codigo,
        nome.split(','),
        ingles.split(','),
        cientifico,
        grupo,
        fabricante,
      );
    case 2:
      print("Digite a validade no formado yyyy-MM-dd (2021-09-01)");
      String validade = stdin.readLineSync();
      DateTime datetime = DateTime.parse(validade);

      return Natural(codigo, nome.split(','), ingles.split(','), cientifico,
          grupo, datetime);

    default:
      return null;
  }
}

void showListAlimentos(List<Alimento> alimentos) {
  for (var alimento in alimentos) {
    print(alimento.toString());
  }
}

Alimento updateAlimento(Alimento alimento) {
  int option = showUpdateMenu();

  switch (option) {
    case 1:
      print("Digite o nome");
      String nome = stdin.readLineSync();
      alimento.nome = nome.split(",");
      break;
    case 2:
      print("Digite o nome científico");
      String cientifico = stdin.readLineSync();
      alimento.cientifico = cientifico;
      break;
    case 3:
      print("Digite o nome em inglês");
      String ingles = stdin.readLineSync();
      alimento.ingles = ingles.split(",");
      break;
    case 4:
      print("Digite o grupo");
      String grupo = stdin.readLineSync();
      alimento.grupo = grupo;
      break;
    default:
  }
  return alimento;
}
// Função principal
void main(List<String> args) {
  final daoAlimento = AlimentoDAO();

  int option = -1;

  do {
    option = showMainMenu();

    switch (option) {
      case 1:
        final alimento = createAlimento();
        daoAlimento.create(alimento);
        break;
      case 2:
        final alimentos = daoAlimento.listAll();
        showListAlimentos(alimentos);
        break;
      case 3:
      print("Qual Codigo do Alimento");
      String codigo = stdin.readLineSync();
        final alimento = updateAlimento(daoAlimento.getByCod(codigo));
        daoAlimento.update(alimento);
        break;
      case 0:
        break;
      default:
        print('Comando invalido');
    }
  } while (option != 0);
}
