//5. Calcular e exibir a soma dos “N” primeiros valores da seqüência abaixo.
// O valor “N” será digitado, deverá ser positivo, mas menor que cem. Caso o
// valor não satisfaça a restrição, enviar mensagem de erro e solicitar o
// valor novamente.
// A seqüência: 2, 5, 10, 17, 26, ....
import 'dart:math';

main() {
  int N = 5;
  int x = 1;
  int y = 1;
  int soma = 0;

  if(N > 0 && N < 100){
    for(int i = x; i <= N; i++){
      x = x + y;
      print(x);
      soma = soma + x;
      y = y + 2;
    }
    print("SOMA: ${soma}");
  }else{
    print("ERRO");
  }

}