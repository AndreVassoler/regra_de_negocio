// Definindo uma classe genérica para contas bancárias
class ContaBancaria<T> {
  T numeroDaConta;
  double saldo;

  ContaBancaria(this.numeroDaConta, this.saldo);

  void depositar(double valor) {
    saldo += valor;
    print('Depósito de $valor realizado. Saldo atual: $saldo');
  }

  void sacar(double valor) {
    if (valor <= saldo) {
      saldo -= valor;
      print('Saque de $valor realizado. Saldo atual: $saldo');
    } else {
      print('Saldo insuficiente.');
    }
  }
}

// Restrição de tipo: Apenas contas com String como número da conta
class ContaCorrente extends ContaBancaria<String> {
  ContaCorrente(String numeroDaConta, double saldo)
      : super(numeroDaConta, saldo);
}

class ContaPoupanca extends ContaBancaria<String> {
  ContaPoupanca(String numeroDaConta, double saldo)
      : super(numeroDaConta, saldo);
}

void main() {
  var contaCorrente = ContaCorrente('12345-6', 1000.0);
  var contaPoupanca = ContaPoupanca('65432-1', 5000.0);

  contaCorrente.depositar(500);
  contaCorrente.sacar(300);

  contaPoupanca.depositar(1000);
  contaPoupanca.sacar(700);
}
