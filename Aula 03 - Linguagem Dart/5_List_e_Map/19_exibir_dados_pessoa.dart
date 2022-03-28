// 4. Armazenar o nome e idade de cem pessoas. Após a digitação, exibir os
// dados (nome e idade) de todas as pessoas.

import 'dart:math';

void main() {
  final nomes = [];
  final idades = [];
  var random = new Random();
  int limite = 100;

  for(int i = 0; i < limite; i++){
    int randomNumb = random.nextInt(100);
    String randomNome = "nome-$i";
    nomes.add(randomNome);
    idades.add(randomNumb);
  }
  for(int j = 0; j < limite; j++){
    String name = nomes[j];
    int age = idades[j];
    print("$jº = ${name} ${age}");
  }
}