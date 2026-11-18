// Student: Rowan Abubaker
// Reg no: 25740
const String regNo = '25740';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// Part B: Strings

// B2: Count vowels (a, e, i, o, u) case-insensitively
int countVowels(String text) {
  // by OM
  int count = 0;
  String lower = text.toLowerCase();
  for (int i = 0; i < lower.length; i++) {
    String ch = lower[i];
    if (ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u') {
      count++;
    }
  }
  return count;
}

// B3: Return uppercase initials followed by dots
String initials(String fullName) {
  // by OM
  String trimmed = fullName.trim();
  if (trimmed.isEmpty) {
    return '';
  }
  List<String> parts = trimmed.split(' ');
  String result = '';
  for (int i = 0; i < parts.length; i++) {
    String part = parts[i];
    if (part.isNotEmpty) {
      result += part[0].toUpperCase() + '.';
    }
  }
  return result;
}

// Part C: Control Flow

// C5: Draw right-aligned triangle with alternating characters
void drawTriangle(int height) {
  // by OM
  if (height <= 0) {
    return;
  }
  for (int r = 1; r <= height; r++) {
    String symbol = '*';
    if (r % 2 == 0) {
      symbol = '#';
    }
    String spaces = ' ' * (height - r);
    String chars = symbol * r;
    print(spaces + chars);
  }
}

// Part D: Functions

// D2: MoMo fee calculator based on fictional tariff
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

// D2: Mask phone number keeping first 3 and last 2 characters
String maskPhone(String phone) {
  // by OM
  if (phone.length != 10) {
    return 'INVALID';
  }
  String prefix = phone.substring(0, 3);
  String suffix = phone.substring(8);
  String middle = '';
  int idx = 3;
  while (idx < 8) {
    middle += '*';
    idx++;
  }
  return prefix + middle + suffix;
}

void main() {
  // Required first printed line
  print('Reg no: $regNo | D = $d | T = $t');

  print('\n--- Part B2: countVowels ---');
  int vowels = countVowels('Rowan Abubaker');
  print('Rowan Abubaker has $vowels vowels');

  print('\n--- Part B3: initials ---');
  print(initials('Rowan Abubaker'));
  print(initials(' ana uwase '));
  print(initials(' '));

  print('\n--- Part C5: drawTriangle ---');
  print('Calling drawTriangle(d + 3) -> height = ${d + 3}:');
  drawTriangle(d + 3);

  print('Calling drawTriangle(0):');
  drawTriangle(0);

  print('Calling drawTriangle(-2):');
  drawTriangle(-2);

  print('\n--- Part D2: MoMo receipt printer ---');
  int i = 1;
  int totalFees = 0;
  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    totalFees += fee;
    String masked = maskPhone('0788123456');
    print('Receipt $i | $amount RWF | fee $fee RWF | to $masked');
    i++;
  }
  print('Total fees: $totalFees RWF');
}
