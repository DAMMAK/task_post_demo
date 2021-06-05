import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demotask/di.dart';
import 'package:demotask/modules/task/bloc/task_bloc.dart';
import 'package:demotask/modules/task/widgets/add_task.dart';
import 'package:demotask/modules/task/widgets/task_list.dart';
import 'package:demotask/utils/helpers/route_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskRootWidget extends StatefulWidget {
  @override
  _TaskRootWidgetState createState() => _TaskRootWidgetState();
}

class _TaskRootWidgetState extends State<TaskRootWidget> {
  Stream<QuerySnapshot> tasks;

  @override
  void initState() {
    ioc.get<TaskBloc>().add(GetTask());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task List")),
      body: BlocBuilder(
        bloc: ioc.get<TaskBloc>(),
        builder: (context, state) {
          if (state is FetchingTasks) {
            return loader();
          }
          if (state is FetchedTasks) {
            tasks = state.tasks;
            return TaskListView(queryTasks: tasks);
          }
          return tasks != null ? TaskListView(queryTasks: tasks) : loader();
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(FadeRoute(page: AddTaskWidget()));
          }),
    );
  }

  Widget loader() {
    Center(
      child: CircularProgressIndicator(),
    );
  }
}
