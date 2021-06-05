part of 'post_bloc.dart';

@immutable
abstract class PostEvent extends Equatable {}

class GetPosts extends PostEvent {
  @override
  List<Object> get props => [];
}
