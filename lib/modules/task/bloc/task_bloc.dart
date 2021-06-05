import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demotask/modules/task/model/task.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

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
  }

  Stream<TaskState> _mapSaveTaskEventToState(SaveTask event) async* {
    yield SavingTask();
  }
}
