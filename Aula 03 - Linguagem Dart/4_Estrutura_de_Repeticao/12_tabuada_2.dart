//2. Entrar via teclado com um valor (X) qualquer. Digitar o intervalo que o
// programa que deverá calcular a tabuada do valor X digitado, sendo que o
// segundo valor (B), deverá ser maior que o primeiro (A). Exibir a tabuada do
// valor digitado, no intervalo decrescente, ou seja, a tabuada de X no
// intervalo de B para A.
import 'dart:math';

main() {
  int x = 5;
  int a = 1;
  int b = 2;

  if(b > a){
    for(int i = b; i >= a; i--){
      int result = x * i;
      print("${x} X ${i} = ${result}");
    }
  }else{
    print("ERRO: Valor de B é menor ou igual ao valor de A!");
  }
}