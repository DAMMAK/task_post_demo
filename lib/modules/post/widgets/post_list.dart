import 'package:demotask/config/app_config.dart';
import 'package:demotask/modules/post/model/post.dart';
import 'package:flutter/material.dart';

class PostListView extends StatelessWidget {
  final List<Post> posts;
  PostListView({this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return PostItem(post: posts[index]);
        });
  }
}

class PostItem extends StatelessWidget {
  final Post post;
  PostItem({this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title,
            style: TextStyle(
                fontSize: getTextSize(context, size: 20),
                fontWeight: FontWeight.w500),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Text(
            post.body,
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: getTextSize(
              context,
              size: 17,
            )),
          ),
          Divider(),
        ],
      ),
    );
  }
}
