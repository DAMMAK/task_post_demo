part of 'post_bloc.dart';

@immutable
abstract class PostState extends Equatable {}

class PostInitial extends PostState {
  @override
  List<Object> get props => [];
}

// [FetchingPosts] is a loading state that emit when it's currently fetching post's from the server
class FetchingPosts extends PostState {
  @override
  List<Object> get props => [];
}

// [FetchedPosts] is a loading state that got triggered when user's data has been successfully fetched
class FetchedPosts extends PostState {
  final List<Post> posts;
  FetchedPosts({this.posts});

  @override
  List<Object> get props => [posts];
}

// [FetchedPostsWithError] is a Error state that got triggered when the network request was not successful
class FetchedPostsWithError extends PostState {
  final String message;
  FetchedPostsWithError({this.message});

  @override
  List<Object> get props => [message];
}
