import 'dart:io';

class Task {
  String title;
  bool isCompleted;

  Task(this.title, [this.isCompleted = false]);

  void toggleCompletion() {
    isCompleted = !isCompleted;
  }

  @override
  String toString() {
    return '${isCompleted ? "[✔]" : "[ ]"} $title';
  }
}

class ToDoList {
  List<Task> tasks = [];

  void addTask(String title) {
    tasks.add(Task(title));
    print('Task "$title" added successfully!');
  }

  void removeTask(int index) {
    if (index < 0 || index >= tasks.length) {
      print('Invalid task number!');
      return;
    }
    print('Task "${tasks[index].title}" removed.');
    tasks.removeAt(index);
  }

  void toggleTask(int index) {
    if (index < 0 || index >= tasks.length) {
      print('Invalid task number!');
      return;
    }
    tasks[index].toggleCompletion();
    print('Task "${tasks[index].title}" updated.');
  }

  void showTasks() {
    if (tasks.isEmpty) {
      print('No tasks available!');
      return;
    }

    print('\nYour To-Do List:');
    for (int i = 0; i < tasks.length; i++) {
      print('${i + 1}. ${tasks[i]}');
    }
    print('');
  }
}

void main() {
  final todoList = ToDoList();
  bool isRunning = true;

  print('Welcome to the To-Do List Application!\n');

  while (isRunning) {
    print('Choose an option:');
    print('1. Add Task');
    print('2. Remove Task');
    print('3. Toggle Task Completion');
    print('4. Show All Tasks');
    print('5. Exit');
    stdout.write('Enter your choice: ');
    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Enter task title: ');
        final title = stdin.readLineSync();
        if (title != null && title.isNotEmpty) {
          todoList.addTask(title);
        } else {
          print('Task title cannot be empty!');
        }
        break;

      case '2':
        todoList.showTasks();
        stdout.write('Enter task number to remove: ');
        final input = stdin.readLineSync();
        final index = int.tryParse(input ?? '');
        if (index != null) {
          todoList.removeTask(index - 1);
        } else {
          print('Invalid input!');
        }
        break;

      case '3':
        todoList.showTasks();
        stdout.write('Enter task number to toggle completion: ');
        final input = stdin.readLineSync();
        final index = int.tryParse(input ?? '');
        if (index != null) {
          todoList.toggleTask(index - 1);
        } else {
          print('Invalid input!');
        }
        break;

      case '4':
        todoList.showTasks();
        break;

      case '5':
        print('Exiting application. Goodbye!');
        isRunning = false;
        break;

      default:
        print('Invalid choice. Please try again.');
    }
    print('');
  }
}
