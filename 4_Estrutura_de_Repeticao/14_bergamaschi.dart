//4. Exibir os vinte primeiros valores da série de Bergamaschi.
// A série: 1, 1, 1, 3, 5, 9, 17, ...

void main() {
  int x = 3;
  int y = 2;
  print("1");
  print("1");
  print("1");
  print("3");
  // +2 +2 +4 +8
  for(int i = 4; i <= 20; i++){
    x = x + y;
    print(x);
    y = y + y;
  }
}