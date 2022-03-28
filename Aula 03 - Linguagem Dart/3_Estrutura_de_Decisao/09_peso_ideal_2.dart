//4. Entrar com o peso, o sexo e a altura de uma determinada pessoa. Após a digitação, exibir se esta pessoa
// está ou não com seu peso ideal. Fórmula: peso/altura².
import 'dart:math';

main() {
  var peso = 10,
      sexo = 'm',
      altura = 1.83;

  var imc = peso/pow(altura, 2);
  if(sexo == 'm'){
    if(imc < 20){
      print("IMC = ${imc}kg/m²: Abaixo do peso!");
    }else if(imc >= 20 && imc < 25){
      print("IMC = ${imc}kg/m²: Peso Ideal.");
    }else{
      print("IMC = ${imc}kg/m²: Acima do peso!");
    }
  } else {
    if(imc < 19){
      print("IMC = ${imc}kg/m²: Abaixo do peso!");
    }else if(imc >= 19 && imc < 24){
      print("IMC = ${imc}kg/m²: Peso Ideal.");
    }else{
      print("IMC = ${imc}kg/m²: Acima do peso!");
    }
  }
}