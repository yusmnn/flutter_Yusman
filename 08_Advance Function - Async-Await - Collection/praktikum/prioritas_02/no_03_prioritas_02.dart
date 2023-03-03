/*
3. Buatlah sebuah program unutk melakukan perhitungan bilangan faktorial secara asinkron
  sampel input: 5
  sampel output: 120
*/

import 'dart:io';

void main() async {
  num input = 5;
  BigInt result = await faktorialBilangan(input);
  print(" $input! = $result");
}

Future<BigInt> faktorialBilangan(num input) async {
  BigInt faktorial = BigInt.from(input);

  for (int i = 1; i < input; i++) {
    faktorial *= BigInt.from(i);
    stdout.write(" $i ");
    await Future.delayed(
      Duration(
        seconds: 1,
      ),
    );
  }
  return faktorial;
}
