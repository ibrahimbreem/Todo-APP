import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';
import 'package:todo/pages/todo_home.dart';
import 'package:todo/pages/widgets/task_widget.dart';

class AllTasksPage extends StatelessWidget {
  List<Task> tasks;
  Function function;
  Function toggleFun;
  Function addTask;

  AllTasksPage(this.tasks, this.function, this.toggleFun, this.addTask);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return TaskWidget(tasks[index], function, toggleFun, addTask);
          }),
    );
  }
}
