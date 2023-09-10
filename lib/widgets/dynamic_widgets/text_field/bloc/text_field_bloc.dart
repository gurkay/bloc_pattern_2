import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'text_field_bloc_event.dart';
part 'text_field_bloc_state.dart';

class InitialEvent extends TextFieldBlocEvent {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  List<String> friendsList = [''];
  List<Widget> friendsTextFields = [];

  @override
  GlobalKey<FormState> getFormKey() {
    return formKey;
  }

  @override
  List<String> getFriendsList() {
    return friendsList;
  }

  @override
  TextEditingController getNameController() {
    return nameController;
  }

  void setNameController(String text) {
    nameController.text = text;
  }

  Widget _onFriendTextFields(int i) {
    setNameController(friendsList[i]);
    return TextFormField(
      controller: nameController,
      onChanged: (v) => friendsList[i] = v,
      decoration: const InputDecoration(hintText: 'Enter your friend\'s name'),
      validator: (v) {
        if (v!.trim().isEmpty) return 'Please enter something';
        return null;
      },
    );
  }
}

class AddTextFieldEvent extends TextFieldBlocEvent {
  Widget _onAddRemoveButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          InitialEvent().friendsList.insert(0, '');
        } else {
          InitialEvent().friendsList.removeAt(index);
        }
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.amber : Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove,
          color: Colors.red,
        ),
      ),
    );
  }

  @override
  GlobalKey<FormState> getFormKey() {
    return InitialEvent().getFormKey();
  }

  @override
  List<String> getFriendsList() {
    return InitialEvent().friendsList;
  }

  @override
  TextEditingController getNameController() {
    return InitialEvent().nameController;
  }
}

class TextFieldBloc extends Bloc<TextFieldBlocEvent, TextFieldBlocState> {
  TextFieldBloc()
      : super(
          TextFieldBlocState(
            formKey: InitialEvent().formKey,
            nameController: InitialEvent().nameController,
            friendsList: InitialEvent().friendsList,
            friendsTextFields: InitialEvent().friendsTextFields,
            testString: 'initial',
          ),
        ) {
    on<AddTextFieldEvent>(_onGetFriendsTextFields);
  }

  void _onGetFriendsTextFields(
      AddTextFieldEvent event, Emitter<TextFieldBlocState> emit) {
    emit(TextFieldBlocState().copyWith(testString: 'Test'));
    for (int i = 0; i < InitialEvent().friendsList.length; i++) {
      InitialEvent().friendsTextFields.add(
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: [
                  Expanded(child: InitialEvent()._onFriendTextFields(i)),
                  const SizedBox(
                    width: 16,
                  ),
                  // we need add button at last friends row
                  AddTextFieldEvent()._onAddRemoveButton(
                      i == InitialEvent().friendsList.length - 1, i),
                ],
              ),
            ),
          );
    }
    emit(TextFieldBlocState()
        .copyWith(friendsTextFields: InitialEvent().friendsTextFields));
  }
}
