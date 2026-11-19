// Student: Uwingabire Shakilah
// Reg no:  19402
const String regNo = '19402';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// by US
int countVowels(String text) {
  // by US
  final String lower = text.toLowerCase();
  int count = 0;
  for (int i = 0; i < lower.length; i++) {
    if ('aeiou'.contains(lower[i])) {
      count++;
    }
  }
  return count;
}

// by US
String initials(String fullName) {
  // by US
  final List<String> names =
      fullName.trim().split(RegExp(r'\s+')).where((name) => name.isNotEmpty).toList();
  if (names.isEmpty) return '';

  String result = '';
  for (final String name in names) {
    result += '${name[0].toUpperCase()}.';
  }
  return result;
}

// by US
void drawTriangle(int height) {
  // by US
  if (height <= 0) return;

  int row = 1;
  while (row <= height) {
    final int spaces = height - row;
    final String symbol = row.isOdd ? '*' : '#';
    print('${List.filled(spaces, ' ').join()}${List.filled(row, symbol).join()}');
    row++;
  }
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
String maskPhone(String phone) {
  // by US
  if (phone.length != 10) return 'INVALID';
  return '${phone.substring(0, 3)}${List.filled(phone.length - 5, '*').join()}${phone.substring(phone.length - 2)}';
}

// Student information must be the first printed line.
void main() {
  print('Reg no: $regNo | D = $d | T = ${t.toString().padLeft(2, '0')}');

  // B2
  const String fullName = 'Uwingabire Shakilah';
  print('$fullName has ${countVowels(fullName)} vowels');

  // B3
  print(initials(fullName));
  print(initials(' ana uwase '));
  print(initials(' '));

  // C5
  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  // D2
  int totalFees = 0;
  int i = 1;
  while (i <= d + 3) {
    final int amount = i * 4000 + t * 100;
    final int fee = momoFee(amount);
    totalFees += fee;
    print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone('0788123456')}');
    i++;
  }
  print('Total fees: $totalFees RWF');
}
