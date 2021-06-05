import 'package:demotask/di.dart';
import 'package:demotask/modules/post/bloc/post_bloc.dart';
import 'package:demotask/modules/post/model/post.dart';
import 'package:demotask/modules/post/widgets/list_loading.dart';
import 'package:demotask/modules/post/widgets/post_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostWidget extends StatefulWidget {
  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  List<Post> posts;

  @override
  void initState() {
    // get posts
    ioc.get<PostBloc>().add(GetPosts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BlocBuilder(
            bloc: ioc.get<PostBloc>(),
            builder: (context, state) {
              if (state is FetchingPosts) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ListLoadingWidget();
                      }),
                );
              }
              if (state is FetchedPosts) {
                posts = state.posts;
                return Expanded(
                  child: PostListView(
                    posts: posts,
                  ),
                );
              }
              return Expanded(
                child: PostListView(
                  posts: posts,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
