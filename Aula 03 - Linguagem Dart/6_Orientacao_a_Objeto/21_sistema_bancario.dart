// Criar um mini sistema bancário com as classes: Conta, Conta Corrente,
// Conta Poupança e Cliente. Cada classe deve ter atributos específicos.
// No sistema devemos ter pelo menos 3 funcionalidades: Saque, Depósito
// e Transferência.

void main() {
  ContaCorrente conta1 = new ContaCorrente(
      int.parse('001'),
      double.parse('0'),
      100
  );
  Cliente cliente1 = new Cliente(conta1, "Angelo");

  ContaPoupanca conta2 = new ContaPoupanca(
      int.parse('002'),
      double.parse('0'),
      2
  );
  Cliente cliente2 = new Cliente(conta2, "Thiago");

  conta1.Deposito(200);
  conta1.Saque(50);
  conta1.Saque(15.2);

  conta1.Transferencia(10, conta2);

  conta2.Saque(7);

  print(cliente1);
  print(cliente2);

}

class Conta{
  int idConta;
  double qtdDinheiro;
  String historico = "\n\t Histórico \n";

  Conta(this.idConta, this.qtdDinheiro);

  Deposito(double qtdDinheiro){
    if(qtdDinheiro > 0){
      this.qtdDinheiro += qtdDinheiro;
      this.SalvarHistorico("** Depósito R\$$qtdDinheiro **");
    }
  }

  Saque(double qtdDinheiro){
    if(qtdDinheiro <= this.qtdDinheiro){
      this.qtdDinheiro -= qtdDinheiro;
      this.SalvarHistorico("** Saque R\$$qtdDinheiro **");
      return true;
    }else {
      return false;
    }
  }

  Transferencia(double qtdDinheiro, Conta destino){
    if(this.Saque(qtdDinheiro)){
      destino.Deposito(qtdDinheiro);
      this.SalvarHistorico("** Transferência R\$$qtdDinheiro **");
    }
  }

  SalvarHistorico(String event){
    this.historico += "\t\t$event\n";
  }

  @override
  String toString() {
    return "\tidConta: $idConta\n\tqtdDinheiro: R\$$qtdDinheiro\n\t\t$historico";
  }
}

class ContaCorrente extends Conta {
  double chequeEspecial;

  ContaCorrente(idConta, qtdDinheiro,this.chequeEspecial):super(idConta, qtdDinheiro);

  @override
  String toString() {
    return "\tidConta: $idConta\n\tqtdDinheiro: R\$$qtdDinheiro\n\tCheque Especial: R\$$chequeEspecial\n$historico";
  }

  @override
  Saque(double qtdDinheiro){
    double qtdDinheiroCheque = this.qtdDinheiro + this.chequeEspecial;

    if(qtdDinheiro <= this.qtdDinheiro){
      this.qtdDinheiro -= qtdDinheiro;
      this.SalvarHistorico("** Saque R\$$qtdDinheiro **");
      return true;
    }else if(qtdDinheiro <= qtdDinheiroCheque) {
      double usoCheque = qtdDinheiro - this.qtdDinheiro;
      this.qtdDinheiro -= qtdDinheiro;
      this.chequeEspecial = this.chequeEspecial - usoCheque;

      this.SalvarHistorico("** Saque [Limite Especial] $qtdDinheiro **");
      return true;
    }else {
      return false;
    }
  }
}

class ContaPoupanca extends Conta {
  int taxaRendimento;

  ContaPoupanca(idConta, qtdDinheiro, this.taxaRendimento):super(idConta, qtdDinheiro);

  @override
  String toString() {
    return "\tidConta: $idConta\n\tqtdDinheiro: R\$$qtdDinheiro\n\tTaxa Rendimento: $taxaRendimento%\n$historico";
  }
}

class Cliente{
  String nome;
  Conta conta;

  Cliente(this.conta, this.nome);

  String toString() {
    return "Nome: $nome\n$conta\n";
  }
}