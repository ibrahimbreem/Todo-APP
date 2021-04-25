import 'package:todo/models/task.dart';

class Repository {
  static List<Task> tasks = [
    Task(
        title: 'Developing Flutter App',
        description: 'Use setState to develope awsome app',
        id: '1',
        isComplete: false),
    Task(
        title: 'Playing Football',
        description: 'paying football with my friends',
        id: '2',
        isComplete: false),
    Task(
        title: 'Watching tv',
        description: 'watching my favourite movie with my family',
        id: '3',
        isComplete: true),
    // Task(
    //     title: 'Studying',
    //     description: 'study for my medterm exam',
    //     id: '4',
    //     isComplete: false),
    // Task(
    //     title: 'Help People',
    //     description: 'Make something good for the people',
    //     id: '5',
    //     isComplete: true),
  ];
}
