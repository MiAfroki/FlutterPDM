//2. Entrar com o peso e a altura de uma determinada pessoa. Após a digitação, exibir se esta pessoa
// está ou não com seu peso ideal. Fórmula: peso/altura².
import 'dart:math';

main() {
  var peso = 150,
      altura = 1.83;

  var imc = peso/pow(altura, 2);

  if(imc < 18.5){
    print("IMC = ${imc}kg/m²: Magreza!");
  }else if(imc >= 18.5 && imc < 24.9){
    print("IMC = ${imc}kg/m²: Normal.");
  }else if(imc >= 24.9 && imc <= 30){
    print("IMC = ${imc}kg/m²: Sobrepeso!");
  }else{
    print("IMC = ${imc}kg/m²: Obesidade!");
  }
}