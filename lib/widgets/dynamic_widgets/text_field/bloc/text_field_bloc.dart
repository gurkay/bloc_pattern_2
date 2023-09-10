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

class AddTextFieldEvent extends InitialEvent {
  void _onGetFriendsTextFields(
      AddTextFieldEvent event, Emitter<TextFieldBlocState> emit) {
    for (int i = 0; i < friendsList.length; i++) {
      friendsTextFields.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            children: [
              Expanded(child: _onFriendTextFields(i)),
              const SizedBox(
                width: 16,
              ),
              // we need add button at last friends row
              _onAddRemoveButton(i == friendsList.length - 1, i),
            ],
          ),
        ),
      );
    }
    emit(TextFieldBlocState().copyWith(friendsTextFields: friendsTextFields));
  }

  Widget _onAddRemoveButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          friendsList.insert(0, '');
        } else {
          friendsList.removeAt(index);
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
}

class TextFieldBloc extends Bloc<TextFieldBlocEvent, TextFieldBlocState> {
  TextFieldBloc()
      : super(
          TextFieldBlocState(
            InitialEvent().formKey,
            InitialEvent().nameController,
            InitialEvent().friendsList,
            InitialEvent().friendsTextFields,
          ),
        ) {
    on<InitialEvent>(
      (event, emit) => emit(
        TextFieldBlocState(
          event.getFormKey(),
          event.getNameController(),
          event.getFriendsList(),
          const [],
        ),
      ),
    );
    on<AddTextFieldEvent>(_onGetFriendsTextFields);
  }
}
