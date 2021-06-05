import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demotask/di.dart';
import 'package:demotask/modules/post/model/post.dart';
import 'package:demotask/modules/post/repository/post.repository.dart';
import 'package:demotask/modules/post/service/post_service.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  @override
  PostState get initialState => PostInitial();

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    if (event is GetPosts) {
      yield* mapGetPostsFromServerEventToState();
    }
  }

  Stream<PostState> mapGetPostsFromServerEventToState() async* {
    yield FetchingPosts();

    try {
      // Fetch post from the api server
      var response = await ioc.get<PostService>().getPost();
      if (response.isSuccessful) {
        var data = response.data as List;
        // deserialized the response;
        var posts = data.map((e) {
          var post = Post.fromJson(e);
          ioc.get<PostRepository>().save(post);
          return post;
        }).toList();
        // save all posts to local storage
        yield FetchedPosts(posts: posts);
      }
    } catch (e) {
      yield FetchedPostsWithError(message: "Error occured try again later");
    }
  }
}
