// Armazenar o nome, sexo e idade de cem pessoas. As entradas devem ser
// apenas “F” ou “M” para o sexo e valores positivos para a idade. Após
// a digitação dos dados, exibir os dados (nome, sexo e idade) de todas
// as pessoas do sexo feminino.

import 'dart:math';

void main() {
  final data = [];
  var random = new Random();
  int limit = 100;

  for(int i = 0; i < limit; i++){
    String gender = "";
    String name = "Name-$i";
    int age = random.nextInt(100);

    if(i % 2 == 0){
      gender = "F";
    }else{
      gender = "M";
    }

    data.add(Person(name, gender, age));
  }
  for(Person p in data){
    if(p.gender == "F"){
      print(p);
    }
  }
}
class Person{
  String name;
  String gender;
  int age;

  Person(this.name, this.gender, this.age);

  String toString() {
    return "Nome: $name\nSexo: $gender\nIdade: $age \n";
  }
}