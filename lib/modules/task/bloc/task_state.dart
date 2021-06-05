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
  final Stream<QuerySnapshot> tasks;
  FetchedTasks({this.tasks});

  @override
  List<Object> get props => [tasks];
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

// Update Task States

// [UpdatingTask] is a loading state that emit when it's currently updating task into Firestore
class UpdatingTask extends TaskState {
  @override
  List<Object> get props => [];
}

// [UpdatedTask] is a state that got triggered when task has been successfully updated on Firestore
class TaskUpdated extends TaskState {
  @override
  List<Object> get props => [];
}

// [UpdatedWithError] is a Error state that got triggered when it returns error while updating to firestore
class UpdatedWithError extends TaskState {
  final String message;
  UpdatedWithError({this.message});

  @override
  List<Object> get props => [message];
}

// Delete Task States

// [DeletingTask] is a loading state that emit when it's currently deleting task into Firestore
class DeletingTask extends TaskState {
  @override
  List<Object> get props => [];
}

// [UpdatedTask] is a state that got triggered when task has been successfully updated on Firestore
class TaskDeleted extends TaskState {
  @override
  List<Object> get props => [];
}

// [UpdatedWithError] is a Error state that got triggered when it returns error while updating to firestore
class DeletedWithError extends TaskState {
  final String message;
  DeletedWithError({this.message});

  @override
  List<Object> get props => [message];
}
