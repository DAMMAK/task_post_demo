import 'package:demotask/config/app_color.dart';
import 'package:demotask/config/app_config.dart';
import 'package:demotask/di.dart';
import 'package:demotask/modules/task/bloc/task_bloc.dart';
import 'package:demotask/modules/task/model/task.dart';
import 'package:demotask/utils/widgets/button.dart';
import 'package:demotask/utils/widgets/input_text.dart';
import 'package:demotask/utils/widgets/messenger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskWidget extends StatefulWidget {
  final Task task;
  final TaskOperation taskOperation;
  AddTaskWidget({this.task, this.taskOperation = TaskOperation.create});
  @override
  _AddTaskWidgetState createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Task task;

  @override
  void initState() {
    task = widget.task ?? Task();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var labelStyle = TextStyle(
        fontSize: getTextSize(context, size: 17), fontWeight: FontWeight.w500);

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Post"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: BlocConsumer(
            bloc: ioc.get<TaskBloc>(),
            listener: (context, state) {
              if (state is SavedTask) {
                // Send success message via snackbar
                MessengerWidget.sendMessage(
                    message: "Task created successfully", context: context);
              }

              if (state is SavedTaskWithError) {
                // Send error message via snackbar
                MessengerWidget.sendMessage(
                    message: state.message,
                    context: context,
                    type: MessengerType.error);
              }

              if (state is TaskUpdated) {
                // Send  message via snackbar
                MessengerWidget.sendMessage(
                    message: "Task updated successfully", context: context);
              }
              if (state is UpdatedWithError) {
                // Send error message via snackbar
                MessengerWidget.sendMessage(
                    message: state.message,
                    context: context,
                    type: MessengerType.error);
              }

              if (state is TaskDeleted) {
                // Send  message via snackbar
                MessengerWidget.sendMessage(
                    message: "Task Deleted successfully", context: context);
              }

              if (state is DeletedWithError) {
                // Send error message via snackbar
                MessengerWidget.sendMessage(
                    message: state.message,
                    context: context,
                    type: MessengerType.error);
              }
            },
            builder: (context, state) {
              return Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text("Title", style: labelStyle),
                    SizedBox(height: 10),
                    InputTextWidget(
                      hintText: "",
                      initialValue: task.name ?? "",
                      keyboardType: TextInputType.text,
                      onSaved: (String value) {
                        task.name = value;
                      },
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Post title is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30),
                    Text("Body", style: labelStyle),
                    SizedBox(height: 10),
                    InputTextWidget(
                      height: 150,
                      hintText: "",
                      initialValue: task.description ?? "",
                      keyboardType: TextInputType.text,
                      onSaved: (String value) {
                        task.description = value;
                      },
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Post body is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 40),
                    widget.taskOperation == TaskOperation.create
                        ? MyButton(
                            onTap: () {
                              if (formKey.currentState.validate()) {
                                formKey.currentState.save();
                                ioc.get<TaskBloc>().add(SaveTask(task: task));
                              }
                            },
                            height: 50.0,
                            width: double.infinity,
                            title: "Create Task",
                          )
                        : updateButton(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget updateButton() {
    return Column(
      children: [
        MyButton(
          onTap: () {
            if (formKey.currentState.validate()) {
              formKey.currentState.save();
              ioc.get<TaskBloc>().add(UpdateTask(task: task));
            }
          },
          height: 50.0,
          width: double.infinity,
          title: "Update Task",
        ),
        SizedBox(height: 10),
        MyButton(
          color: AppColors.errorColor,
          onTap: () {
            if (formKey.currentState.validate()) {
              formKey.currentState.save();
              ioc.get<TaskBloc>().add(DeleteTask(task: task));
            }
          },
          height: 50.0,
          width: double.infinity,
          title: "Delete Task",
        )
      ],
    );
  }
}

enum TaskOperation { create, update }
