//3. Exibir os trinta primeiros valores da série de Fibonacci.
// A série: 1, 1, 2, 3, 5, 8, ...
import 'dart:math';

main() {
  int x = 0;
  int v = 1;
  int result = 0;

  print(result);
  print(v);
  for(int i = 1; i <= 30; i++){
    result = x + v;
    print(result);
    x = v;
    v = result;
  }
}