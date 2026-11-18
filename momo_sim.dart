// Student: Rowan Abubaker
// Reg no: 25740
const String regNo = '25740';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// Copied from D2 as required
int momoFee(int amount) {
  // by OM
  if (amount <= 0) {
    return -1;
  } else if (amount <= 1000) {
    return 20;
  } else if (amount <= 10000) {
    return 100;
  } else if (amount <= 150000) {
    return 250;
  } else {
    return 1500;
  }
}

// Formats integer amounts with commas and 'RWF' suffix
String formatRwf(int amount) {
  // by OM
  bool isNegative = amount < 0;
  String digits = amount.abs().toString();
  String formatted = '';
  int count = 0;
  int i = digits.length - 1;
  while (i >= 0) {
    if (count > 0 && count % 3 == 0) {
      formatted = ',' + formatted;
    }
    formatted = digits[i] + formatted;
    count++;
    i--;
  }
  if (isNegative) {
    formatted = '-' + formatted;
  }
  return '$formatted RWF';
}

// Validates 5-digit PIN based on assignment security rules
bool isValidPin(String pin) {
  // by OM
  if (pin.length != 5) {
    return false;
  }
  int i = 0;
  while (i < pin.length) {
    int code = pin.codeUnitAt(i);
    if (code < 48 || code > 57) {
      return false;
    }
    i++;
  }
  if (pin == '12345') {
    return false;
  }
  bool allSame = true;
  int j = 1;
  while (j < pin.length) {
    if (pin[j] != pin[0]) {
      allSame = false;
      break;
    }
    j++;
  }
  if (allSame) {
    return false;
  }
  return true;
}

// Handles money transfer and fee deduction
int sendMoney(int balance, int amount) {
  // by OM
  int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - amount - fee;
  print(
    'Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). New balance: ${formatRwf(newBalance)}',
  );
  return newBalance;
}

// Buys airtime without extra transaction fee
int buyAirtime(int balance, int amount) {
  // by OM
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - amount;
  print(
    'Airtime bought: ${formatRwf(amount)}. New balance: ${formatRwf(newBalance)}',
  );
  return newBalance;
}

void main() {
  // Required first printed line
  print('Reg no: $regNo | D = $d | T = $t');

  print('\n--- PIN Validation Tests ---');
  print('12345: ${isValidPin('12345')}');
  print('77777: ${isValidPin('77777')}');
  print('4821: ${isValidPin('4821')}');
  print('48a21: ${isValidPin('48a21')}');
  print('4821$d: ${isValidPin('4821$d')}');

  print('\n--- Account Transactions ---');
  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  int sendAmount = (d + 1) * 3000;
  // Send 3 times
  balance = sendMoney(balance, sendAmount);
  balance = sendMoney(balance, sendAmount);
  balance = sendMoney(balance, sendAmount);

  // Buy 1,000 airtime
  balance = buyAirtime(balance, 1000);

  // Send 0
  balance = sendMoney(balance, 0);

  // Send 200,000
  balance = sendMoney(balance, 200000);

  print('Final balance: ${formatRwf(balance)}');

  print('\n--- Additional Tests ---');
  print(formatRwf(0)); // expected: 0 RWF
  print(formatRwf(999)); // expected: 999 RWF
  print(formatRwf(-5000)); // expected: -5,000 RWF
  print(isValidPin('00000')); // expected: false (repeated digits)
  print(isValidPin('98765')); // expected: true
  print(isValidPin('1234')); // expected: false (length < 5)
}
