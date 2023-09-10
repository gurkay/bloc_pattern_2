part of 'text_field_bloc.dart';

class TextFieldBlocState extends Equatable {
  GlobalKey<FormState>? formKey;
  TextEditingController? nameController;
  List<String>? friendsList;
  List<Widget>? friendsTextFields;
  String? testString;

  TextFieldBlocState({
    this.formKey,
    this.nameController,
    this.friendsList,
    this.friendsTextFields,
    this.testString,
  });
  TextFieldBlocState copyWith({
    GlobalKey<FormState>? formKey,
    TextEditingController? nameController,
    List<String>? friendsList,
    List<Widget>? friendsTextFields,
    String? testString,
  }) {
    return TextFieldBlocState(
      formKey: formKey ?? this.formKey,
      nameController: nameController ?? this.nameController,
      friendsList: friendsList ?? this.friendsList,
      friendsTextFields: friendsTextFields ?? this.friendsTextFields,
      testString: testString ?? this.testString,
    );
  }

  @override
  List<Object?> get props => [formKey];
}
