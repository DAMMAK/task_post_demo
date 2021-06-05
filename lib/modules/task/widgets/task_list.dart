import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demotask/config/app_config.dart';
import 'package:demotask/modules/task/model/task.dart';
import 'package:demotask/modules/task/widgets/add_task.dart';
import 'package:demotask/utils/widgets/input_text.dart';
import 'package:flutter/material.dart';

class TaskListView extends StatefulWidget {
  final Stream<QuerySnapshot> queryTasks;
  TaskListView({this.queryTasks});

  @override
  _TaskListViewState createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  List<Task> _task;

  List<Task> filteredList;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: widget.queryTasks,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapShot) {
        _task = snapShot.data.docs.map((e) => Task.fromJson(e.data())).toList();
        filteredList = _task;
        return Column(
          children: [
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: InputTextWidget(
                hintText: "Search Todo's Task",
                onChange: (value) {
                  setState(() {
                    var __task = snapShot.data.docs
                        .map((e) => Task.fromJson(e.data()))
                        .toList();

                    filteredList = __task.where((element) {
                      if (element.name != null &&
                          element.name
                              .toLowerCase()
                              .contains(value.toLowerCase())) return true;
                      return false;
                    }).toList();
                  });
                },
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    return PostItem(task: filteredList[index]);
                  }),
            ),
            Text("Tap on each item edit")
          ],
        );
      },
    );
    // return ListView.builder(
    //     itemCount: queryTasks.length,
    //     itemBuilder: (context, index) {
    //       return PostItem(task: queryTasks[index]);
    //     });
  }
}

class PostItem extends StatelessWidget {
  final Task task;
  PostItem({this.task});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddTaskWidget(
                  task: task,
                  taskOperation: TaskOperation.update,
                )));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  task.name,
                  style: TextStyle(
                      fontSize: getTextSize(context, size: 20),
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                      color: task.isCompleted ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    task.isCompleted ? "Completed" : "Uncompleted",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getTextSize(context, size: 18),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(
              task.description,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: getTextSize(
                context,
                size: 17,
              )),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
