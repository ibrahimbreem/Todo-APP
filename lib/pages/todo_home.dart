import 'package:flutter/material.dart';
import 'package:todo/data/repository.dart';
import 'package:todo/models/task.dart';
import 'package:todo/pages/pages/all_tasks.dart';
import 'package:todo/pages/pages/complete_tasks.dart';
import 'package:todo/pages/pages/inComplete_tasks.dart';

class TodoHome extends StatefulWidget {
  @override
  _TodoHomeState createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  PageController pageController = PageController(initialPage: 0);

  int currentIndex = 0;
  deleteTask(Task task) {
    Repository.tasks.remove(task);
    setState(() {});
  }

  toggleTask(Task task) {
    int taskIndex = Repository.tasks.indexOf(task);
    task.isComplete = !task.isComplete;
    setState(() {});
  }

  addTask() {
    Repository.tasks.add(Task(
        title: 'Playing',
        description: 'Play with my Frind',
        id: '5',
        isComplete: false));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.cyan,
        onPressed: () {
          addTask();
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text(
          'Tasks Home',
          style: TextStyle(fontSize: 25, color: Colors.cyan),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.amber,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                iconSize: 40,
                icon: Icon(
                  Icons.list,
                  color: currentIndex == 0 ? Colors.blue : Colors.black,
                ),
                onPressed: () {
                  pageController.jumpToPage(0);
                  currentIndex = 0;
                }),
            IconButton(
                iconSize: 40,
                icon: Icon(
                  Icons.done,
                  color: currentIndex == 1 ? Colors.blue : Colors.black,
                ),
                onPressed: () {
                  pageController.jumpToPage(1);
                  currentIndex = 1;
                }),
            IconButton(
                iconSize: 40,
                icon: Icon(
                  Icons.close,
                  color: currentIndex == 2 ? Colors.blue : Colors.black,
                ),
                onPressed: () {
                  pageController.jumpToPage(2);
                  currentIndex = 2;
                })
          ],
        ),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {},
        children: [
          AllTasksPage(Repository.tasks, deleteTask, toggleTask, addTask),
          CompleteTasksPage(Repository.tasks, deleteTask, toggleTask, addTask),
          InCompleteTasksPage(Repository.tasks, deleteTask, toggleTask, addTask)
        ],
      ),
    );
  }
}

class AddTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
          color: Colors.greenAccent, borderRadius: BorderRadius.circular(15)),
    );
  }
}
