// 3. Armazenar vinte valores em um vetor. Após a digitação, entrar com uma
// constante multiplicativa que deverá multiplicar cada um dos valores do
// vetor e armazenar o resultado no próprio vetor, na respectiva posição.

void main() {
  final numb = [];
  int x = 4;

  for(int i = 0; i < 20; i++){
    numb.add(i);
  }
  numb.asMap().forEach((index, element){
    numb[index] = element * x;
  });
  for(int number in numb){
    print(number);
  }
}