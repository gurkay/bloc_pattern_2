abstract class IUserManager {
  void sayId(User user);
  void sayName(User user);
  void sayMoney(User user);
  double calculateSumMoney(List<User> users);
}

class User {
  final String id;
  final String name;
  final double money;

  User(this.id, this.name, this.money);
}

class UserManager<T extends AdminUser> {
  final T admin;

  UserManager(this.admin);

  @override
  void sayId(User user) {
    print(user.id);
  }

  @override
  void sayName(User user) {
    print(user.name);
  }

  @override
  void sayMoney(User user) {
    print(user.money);
  }

  @override
  double calculateSumMoney(List<User> users) {
    double sum = 0;
    for (User user in users) {
      sum += user.money;
    }

    double initialValue = admin.role == '1' ? admin.money : 0;
    final sumMoney = users.map((e) => e.money).fold(
        initialValue, (previousValue, element) => previousValue + element);
    return sumMoney;
  }

  Iterable<GeneralModel<R>>? showName<R>(List<User> users) {
    if (R == String) {
      final names = users
          .map((e) => GeneralModel<R>(e.name.split('').toList().cast<R>()));
      return names;
    }

    return null;
  }
}

class GeneralModel<T> {
  final String name = 'empty';
  final List<T> items;

  GeneralModel(this.items);
}

class AdminUser extends User {
  final String role;
  AdminUser(super.id, super.name, super.money, this.role);
}
