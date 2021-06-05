part of 'task_bloc.dart';

@immutable
abstract class TaskEvent extends Equatable {}

class GetTask extends TaskEvent {
  @override
  List<Object> get props => [];
}

class SaveTask extends TaskEvent {
  final Task task;

  SaveTask({this.task});

  @override
  List<Object> get props => [];
}

class UpdateTask extends TaskEvent {
  final Task task;

  UpdateTask({this.task});

  @override
  List<Object> get props => [];
}

class DeleteTask extends TaskEvent {
  final Task task;

  DeleteTask({this.task});

  @override
  List<Object> get props => [];
}
