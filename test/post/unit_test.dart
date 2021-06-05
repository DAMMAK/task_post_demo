import 'package:demotask/modules/post/model/post.dart';
import 'package:demotask/modules/post/repository/post.repository.dart';
import 'package:demotask/modules/post/service/post_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';

class MockBox<T> extends Mock implements Box<T> {}

class MockPost extends Mock implements Post {}

// class MockPostBloc extends MockBloc<PostEvent, PostState> implements PostBloc {}

class MockPostService extends Mock implements PostService {}

class MockHttpResponse extends Mock implements Response {}

void main() async {
  final post1 = Post(
      userId: 10,
      id: 1,
      title: "Testing app 1",
      body: "The new way of testing");
  final post2 = Post(
      userId: 10,
      id: 1,
      title: "qui est esse",
      body:
          "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla");

  final postList = [post1, post2];
  final mockPostService = MockPostService();

  // PostBloc bloc;
  // setUp(() {
  //   bloc = PostBloc();
  // });
  //
  // tearDown(() {
  //   bloc.close();
  // });

  group("Given a Post repository", () {
    final postBox = MockBox<Post>();
    final postRepo = PostRepository(postBox);
    when(postBox.values).thenReturn(postList);

    test("it should return all post", () {
      final posts = postRepo.getAll();
      expect(posts, postList);
    });

    test("it should save a post into the box", () {
      final post = Post(
          userId: 1,
          id: 20,
          title: "fugit voluptas sed molestias voluptatem provident",
          body:
              "eos voluptas et aut odit natus earum\naspernatur fuga molestiae ullam\ndeserunt ratione qui eos\nqui nihil ratione nemo velit ut aut id quo");

      postRepo.save(post);
      verify(postBox.add(post));
    });
  });

  group("Given a post service", () {
    test("Get data from Http", () {
      var requestResponse = Future.value(MockHttpResponse());

      when(mockPostService.getPost()).thenAnswer((_) async => requestResponse);
      mockPostService.getPost();
      verify(mockPostService.getPost());
    });
  });

  // group("Given the Post Bloc", () {
  //   // final bloc = MockPostBloc();
  //   test("the intial stat for the PostlyBloc is [PostInitial]", () {
  //     expect(bloc.state, PostInitial());
  //   });
  //
  //   blocTest<MockPostBloc, PostEvent, PostState>(
  //       "Emit [FetchedPost] when fetching posts from the API Service",
  //       build: () async => MockPostBloc(),
  //       act: (bloc) async => bloc.add(GetPosts()),
  //       expect: [
  //         PostInitial(),
  //         FetchingPosts(),
  //         FetchedPosts(),
  //         FetchedPostsWithError(),
  //       ]);
  // });
}
