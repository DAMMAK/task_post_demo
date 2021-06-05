import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demotask/di.dart';
import 'package:demotask/modules/task/model/task.dart';
import 'package:demotask/modules/task/service/task_service.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskState get initialState => TaskInitial();

  @override
  Stream<TaskState> mapEventToState(
    TaskEvent event,
  ) async* {
    if (event is SaveTask) {
      yield* _mapSaveTaskEventToState(event);
    }
    if (event is GetTask) {
      yield* _mapGetTasksEventToState();
    }
    if (event is UpdateTask) {
      yield* _mapUpdateTasksEventToState(event);
    }
    if (event is DeleteTask) {
      yield* _mapDeleteTasksEventToState(event);
    }
  }

  Stream<TaskState> _mapSaveTaskEventToState(SaveTask event) async* {
    yield SavingTask();

    try {
      event.task.id = Uuid().v4();
      var response = ioc.get<TaskService>().save(event.task);
      yield SavedTask();
    } catch (e) {
      yield SavedTaskWithError(message: "Error occured, try again later!");
    }
  }

  Stream<TaskState> _mapGetTasksEventToState() async* {
    yield FetchingTasks();

    try {
      var tasks = await ioc.get<TaskService>().getTasks();
      yield FetchedTasks(tasks: tasks);
    } catch (e) {
      yield FetchedTasksWithError(message: "Error ocurred, try again later!");
    }
  }

  Stream<TaskState> _mapUpdateTasksEventToState(UpdateTask event) async* {
    yield UpdatingTask();

    try {
      var tasks = ioc.get<TaskService>().updateTask(event.task);
      yield TaskUpdated();
    } catch (e) {
      yield UpdatedWithError(message: "Error ocurred, try again later!");
    }
  }

  Stream<TaskState> _mapDeleteTasksEventToState(DeleteTask event) async* {
    yield DeletingTask();

    try {
      var tasks = ioc.get<TaskService>().deleteTask(event.task);
      yield TaskDeleted();
    } catch (e) {
      yield DeletedWithError(message: "Error ocurred, try again later!");
    }
  }
}
