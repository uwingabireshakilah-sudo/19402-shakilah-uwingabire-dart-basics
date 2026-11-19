// Student: Uwingabire Shakilah
// Reg no:  19402
const String regNo = '19402';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// by US
String formatRwf(int amount) {
  // by US
  final bool negative = amount < 0;
  final String digits = amount.abs().toString();
  final StringBuffer result = StringBuffer();

  int i = 0;
  while (i < digits.length) {
    if (i > 0 && (digits.length - i) % 3 == 0) {
      result.write(',');
    }
    result.write(digits[i]);
    i++;
  }

  return '${negative ? '-' : ''}${result.toString()} RWF';
}

// by US
bool isValidPin(String pin) {
  // by US
  if (pin.length != 5) return false;
  if (!RegExp(r'^[0-9]{5}$').hasMatch(pin)) return false;
  if (pin == '12345') return false;
  if (pin.split('').every((digit) => digit == pin[0])) return false;
  return true;
}

// by US
int momoFee(int amount) {
  // by US
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

// by US
int sendMoney(int balance, int amount) {
  // by US
  final int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  final int newBalance = balance - amount - fee;
  print('Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

// by US
int buyAirtime(int balance, int amount) {
  // by US
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid airtime amount');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  final int newBalance = balance - amount;
  print('Airtime bought: ${formatRwf(amount)}. New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

// Student information must be the first printed line.
void main() {
  print('Reg no: $regNo | D = $d | T = ${t.toString().padLeft(2, '0')}');

  print(isValidPin('12345'));
  print(isValidPin('4821${d}'));
  print(isValidPin('77777'));
  print(isValidPin('4821'));
  print(isValidPin('48a21'));

  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  final int amount = (d + 1) * 3000;
  balance = sendMoney(balance, amount);
  balance = sendMoney(balance, amount);
  balance = sendMoney(balance, amount);
  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 200000);

  print('Final balance: ${formatRwf(balance)}');

  // My own tests (expected output is written next to each call).
  print(formatRwf(0)); // 0 RWF
  print(formatRwf(999)); // 999 RWF
  print(formatRwf(-5000)); // -5,000 RWF
  print(formatRwf(1250000)); // 1,250,000 RWF
  print(isValidPin('48212')); // true
  print(isValidPin('00000')); // false
  print(isValidPin('12a45')); // false
}
