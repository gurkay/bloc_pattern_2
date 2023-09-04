import 'package:bloc_pattern_2/bacik/303/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => null);
  test(
    'UserCalculate ::: calculateSumMoney ::: ',
    () {
      final List<User> users = [
        User('1', 'gurkay', 45000),
        User('2', 'halim', 1000),
        User('3', 'sidika', 30000),
        User('4', 'sukran', 20000),
        User('5', 'halim', 40000),
      ];
      UserManager userManager =
          UserManager(AdminUser('1', 'Gurkay', 1000, '1'));
      final double result = userManager.calculateSumMoney(users);
      final response = UserManager(AdminUser('2', 'Sidika', 2000, '1'))
          .showName<String>(users);
      print(response);
      expect(response, ['gurkay', 'halim', 'sidika', 'sukran', 'halim']);
      expect(result, 137000);
    },
  );
}
