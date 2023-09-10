part of 'text_field_bloc.dart';

class TextFieldBlocState extends Equatable {
  GlobalKey<FormState>? formKey;
  TextEditingController? nameController;
  List<String>? friendsList;
  List<Widget>? friendsTextFields;

  TextFieldBlocState({
    this.formKey,
    this.nameController,
    this.friendsList,
    this.friendsTextFields,
  });
  TextFieldBlocState copyWith({
    GlobalKey<FormState>? formKey,
    TextEditingController? nameController,
    List<String>? friendsList,
    List<Widget>? friendsTextFields,
  }) {
    return TextFieldBlocState(
      formKey: formKey ?? this.formKey,
      nameController: nameController ?? this.nameController,
      friendsList: friendsList ?? this.friendsList,
      friendsTextFields: friendsTextFields ?? this.friendsTextFields,
    );
  }

  @override
  List<Object?> get props => [formKey];
}
