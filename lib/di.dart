// creating a singleton instance of getIt
import 'package:demotask/modules/post/bloc/post_bloc.dart';
import 'package:demotask/modules/post/model/post.dart';
import 'package:demotask/modules/post/repository/post.repository.dart';
import 'package:demotask/modules/post/service/post_service.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

var ioc = GetIt.instance;

Future<void> setupPostModuleService(GetIt ioc) async {
  // Register Post http service
  ioc.registerSingleton<PostService>(PostService());
  // Register Post Bloc
  ioc.registerSingleton<PostBloc>(PostBloc());
  // Register post repository
  var postBox = await Hive.openBox<Post>("posts");
  ioc.registerSingleton<PostRepository>(PostRepository(postBox));
}
