import 'package:demotask/modules/task/widgets/add_task.dart';
import 'package:flutter/material.dart';

class TaskRootWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task List")),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => MaterialPageRoute(
          builder: (context) => AddTaskWidget(),
        ),
      ),
    );
  }
}
