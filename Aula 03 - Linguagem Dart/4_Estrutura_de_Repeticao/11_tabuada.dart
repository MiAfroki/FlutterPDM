//1. Entrar via teclado com um valor qualquer. Após a digitação, exibir a tabuada
// do valor solicitado, no intervalo de um a dez.
import 'dart:math';

main() {
  int n1 = 3;

  for(int i = 0; i <= 10; i++){
    int result = n1 * i;
    print("${n1} X ${i} = ${result}");
  }
}