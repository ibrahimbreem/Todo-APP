import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';
import 'package:todo/pages/widgets/task_widget.dart';

class InCompleteTasksPage extends StatelessWidget {
  List<Task> tasks;
  Function function;
  Function toggleFun;
  Function addTask;

  InCompleteTasksPage(this.tasks, this.function, this.toggleFun, this.addTask);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
          itemCount: tasks.where((element) => !element.isComplete).length,
          itemBuilder: (context, index) {
            return TaskWidget(
                tasks.where((element) => !element.isComplete).toList()[index],
                function,
                toggleFun,
                addTask);
          }),
    );
  }
}
