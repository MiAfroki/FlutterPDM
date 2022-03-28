//1. Calcular e exibir a área de um retângulo, a partir dos valores da base e altura que serão digitados. Se a área for maior que 100,
// exibir a mensagem “Terreno grande”, caso contrário, exibir a mensagem “Terreno pequeno”.
main() {
  var base = 2,
      altura = 100;

  var area = base * altura;
  if(area > 100){
    print("Área ${area}m²: Terreno Grande!");
  }else{
    print("Área ${area}m²: Terreno Pequeno!");
  }
}