//3. A partir de três valores que serão digitados, verificar se formam ou não um triângulo.
// Em caso positivo, exibir sua classificação: “Isósceles, escaleno ou eqüilátero”.
// Um triângulo escaleno possui todos os lados diferentes, o isósceles, dois lados iguais
// e o eqüilátero, todos os lados iguais. Para existir triângulo é necessário que a soma
// de dois lados quaisquer seja maior que o outro, isto, para os três lados
//import 'dart:math';

main() {
  var n1 = 5,
      n2 = 6,
      n3 = 7;

  //Verificação se é um triangulo
  if((n1 - n2) < n3 && n2 + n1 > n3 &&
    (n2 - n3) < n1 && n2 + n3 > n1 &&
    (n3 - n1) < n2 && n3 + n1 > n2){

    if(n1 == n2 && n2 == n3) {
      print("É um triangulo equilátero.");
    }else if(n1 != n2 && n1 != n3 && n2 != n3){
      print("É um triangulo escaleno.");
    }else{
      print("É um triangulo isósceles.");
    }
  }else{
    print("Não é um triangulo!!!");
  }
}