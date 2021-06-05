part of 'task_bloc.dart';

@immutable
abstract class TaskState extends Equatable {}

class TaskInitial extends TaskState {
  @override
  List<Object> get props => [];
}

// [FetchingPosts] is a loading state that emit when it's currently fetching post's from the server
class FetchingTasks extends TaskState {
  @override
  List<Object> get props => [];
}

// [FetchedPosts] is a loading state that got triggered when user's data has been successfully fetched
class FetchedTasks extends TaskState {
  final List<Task> task;
  FetchedTasks({this.task});

  @override
  List<Object> get props => [task];
}

// [FetchedPostsWithError] is a Error state that got triggered when the network request was not successful
class FetchedTasksWithError extends TaskState {
  final String message;
  FetchedTasksWithError({this.message});

  @override
  List<Object> get props => [message];
}

// Save Task States

// [SavingTask] is a loading state that emit when it's currently saving task into Firestore
class SavingTask extends TaskState {
  @override
  List<Object> get props => [];
}

// [SavedTask] is a state that got triggered when task has been successfully saved on Firestore
class SavedTask extends TaskState {
  @override
  List<Object> get props => [];
}

// [SavedTaskWithError] is a Error state that got triggered when it returns error while saving to firestore
class SavedTaskWithError extends TaskState {
  final String message;
  SavedTaskWithError({this.message});

  @override
  List<Object> get props => [message];
}
