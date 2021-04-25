import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';

class TaskWidget extends StatelessWidget {
  Task task;
  Function function;
  Function toggleFun;
  Function addTask;
  TaskWidget(this.task, this.function, this.toggleFun, this.addTask);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
          color: task.isComplete ? Colors.greenAccent : Colors.redAccent,
          borderRadius: BorderRadius.circular(15)),
      child: ListTile(
          title: Text(task.title),
          subtitle: Text(task.description),
          leading: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                function(task);
              }),
          trailing: Checkbox(
              value: task.isComplete,
              onChanged: (value) {
                toggleFun(task);
              })),
    );
  }
}
