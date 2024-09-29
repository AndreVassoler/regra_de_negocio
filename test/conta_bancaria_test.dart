import 'package:flutter_test/flutter_test.dart';
import '../lib/conta_bancaria.dart';

void main() {
  group('ContaCorrente', () {
    test('deve realizar depósito corretamente', () {
      var conta = ContaCorrente('12345-6', 1000.0);
      conta.depositar(500.0);
      expect(conta.saldo,
          equals(1500.0)); // Verifica se o saldo após depósito está correto
    });

    test('deve realizar saque corretamente', () {
      var conta = ContaCorrente('12345-6', 1000.0);
      conta.sacar(300.0);
      expect(conta.saldo,
          equals(700.0)); // Verifica se o saldo após saque está correto
    });

    test('deve impedir saque quando saldo insuficiente', () {
      var conta = ContaCorrente('12345-6', 1000.0);
      conta.sacar(1500.0);
      expect(
          conta.saldo,
          equals(
              1000.0)); // Verifica se o saldo permanece inalterado ao tentar sacar além do saldo
    });
  });

  group('ContaPoupanca', () {
    test('deve realizar depósito corretamente', () {
      var conta = ContaPoupanca('65432-1', 5000.0);
      conta.depositar(1000.0);
      expect(conta.saldo,
          equals(6000.0)); // Verifica se o saldo após depósito está correto
    });

    test('deve realizar saque corretamente', () {
      var conta = ContaPoupanca('65432-1', 5000.0);
      conta.sacar(1000.0);
      expect(conta.saldo,
          equals(4000.0)); // Verifica se o saldo após saque está correto
    });

    test('deve impedir saque quando saldo insuficiente', () {
      var conta = ContaPoupanca('65432-1', 5000.0);
      conta.sacar(6000.0);
      expect(
          conta.saldo,
          equals(
              5000.0)); // Verifica se o saldo permanece inalterado ao tentar sacar além do saldo
    });
  });
}
