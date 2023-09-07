import 'family.dart';
import 'person.dart';

class DummyFamilies {
  static final Map<String, Family> families = <String, Family>{
    'f1': Family(
      name: 'Başyiğit',
      people: <String, Person>{
        'p1': Person(name: 'Gürkay', age: 41),
        'p2': Person(name: 'Sıddıka', age: 39),
        'p3': Person(name: 'Halim', age: 9),
        'p4': Person(name: 'Şükran', age: 63),
        'p5': Person(name: 'Halim', age: 67),
      },
    ),
    'f2': Family(
      name: 'Tokatlıoğlu',
      people: <String, Person>{
        'p1': Person(name: 'Kadir', age: 51),
        'p2': Person(name: 'Abdurrahman', age: 44),
        'p3': Person(name: 'Şöhret', age: 44),
      },
    ),
  };
}
