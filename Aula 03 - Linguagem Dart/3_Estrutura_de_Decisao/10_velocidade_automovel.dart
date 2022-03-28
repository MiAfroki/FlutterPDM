//5. A partir dos valores da aceleração (a em m/s2), da velocidade inicial (v0 em m/s) e do tempo de percurso
// (t em s). Calcular e exibir a velocidade final de automóvel em km/h. Exibir mensagem de acordo com a
// tabela (no Anexo):
import 'dart:math';

main() {
  var acel = 2,
      vel = 5,
      temp = 70;

  var velFinal = vel + acel * temp;

  if(velFinal <= 40){
    print("Velocidade Final = ${velFinal}km/h: Veículo muito lento!");
  } else if(velFinal > 40 && velFinal <= 60) {
    print("Velocidade Final = ${velFinal}km/h: Velocidade permitida");
  } else if(velFinal > 60 && velFinal <= 80) {
    print("Velocidade Final = ${velFinal}km/h: Velocidade de cruzeiro");
  } else if(velFinal > 80 && velFinal <= 120) {
    print("Velocidade Final = ${velFinal}km/h: Veículo rápido!");
  } else {
    print("Velocidade Final = ${velFinal}km/h: Veículo muito rápido!");
  }
}