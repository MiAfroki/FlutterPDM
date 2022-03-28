// 5. Entrar via teclado com o valor de cinco produtos. Após as entradas, digitar um valor referente ao
// pagamento da somatória destes valores. Calcular e exibir o troco que deverá ser devolvido.
main() {
  var n1 = 2,
      n2 = 54,
      n3 = 2,
      n4 = 23,
      n5 = 1;

  var pagamento = 100;
  var troco = pagamento-(n1+n2+n3+n4+n5);

  print("Deve-se dar o troco no valor de R\$${troco}");
}