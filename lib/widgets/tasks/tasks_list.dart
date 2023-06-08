import 'package:flutter/material.dart';

import '../../blocs/bloc_exports.dart';
import '../../models/task.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasksList;
  const TasksList({
    Key? key,
    required this.tasksList,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tasksList.length,
        itemBuilder: (context, index) {
          var task = tasksList[index];
          return ListTile(
            title: Text(task.title),
            trailing: Checkbox(
              value: task.isDone,
              onChanged: (value) {
                context.read<TasksBloc>().add(UpdateTask(task: task));
              },
            ),
            onLongPress: () =>
                context.read<TasksBloc>().add(DeleteTask(task: task)),
          );
        },
      ),
    );
  }
}
