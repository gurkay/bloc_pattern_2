part of 'text_field_bloc.dart';

class TextFieldBlocState {
  GlobalKey<FormState> formKey;
  TextEditingController nameController;
  List<String> friendsList;
  List<Widget> friendsTextFields;

  TextFieldBlocState(
    this.formKey,
    this.nameController,
    this.friendsList,
    this.friendsTextFields,
  );
}
