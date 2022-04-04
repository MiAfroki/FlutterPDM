// 2. Armazenar dez valores na memória do computador. Após a digitação
// dos valores, criar uma rotina para ler os valores e achar e exibir
// o maior deles.

void main() {
  final n1 = [];
  int max = 0;

  for(int i = 0; i < 10; i++){
    n1.add(i);
  }
  for(int n2 in n1){
    if(n2 > max){
      max = n2;
    }
  }
  print(max);
}