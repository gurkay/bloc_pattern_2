part of 'text_field_bloc.dart';

abstract class TextFieldBlocEvent {
  GlobalKey<FormState> getFormKey();
  TextEditingController getNameController();
  List<String> getFriendsList();
  List<Widget> getFriendsTextFields();
}
