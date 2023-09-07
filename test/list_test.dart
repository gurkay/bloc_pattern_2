import 'package:bloc_pattern_2/bacik/product/widget/card/list_card.dart';
import 'package:bloc_pattern_2/models/user.dart';
import 'package:collection/collection.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  test('List Test: ', () {
    List<User> users = [
      User('1', 'Gurkay'),
      User('2', 'Başyiğit'),
      User('3', 'Sıddıka'),
      User('4', 'Halim'),
      User('5', 'Şükran'),
    ];

    List<ListCard> ListCards = users.map((e) {
      return ListCard(items: e.name.split(' ').toList());
    }).toList();

    try {
      final userSingleWhere = users.singleWhere(
        (element) => element.findUserName('Gurkay'),
        orElse: () {
          return const User('0', 'empty');
        },
      );
      print('userSingleWhere: $userSingleWhere');
    } catch (e) {
      print(e);
    }
  });

  test('List Test Collection: ', () {
    List<User> users = [
      User('1', 'Gurkay'),
      User('2', 'Başyiğit'),
      User('3', 'Sıddıka'),
      User('4', 'Halim'),
      User('5', 'Şükran'),
    ];

    final singleWhereOrNull =
        users.singleWhereOrNull((element) => element.findUserName('Gurkay'));
    print('singleWhereOrNull: $singleWhereOrNull');
  });
}
