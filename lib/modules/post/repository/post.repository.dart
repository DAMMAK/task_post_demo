import 'package:demotask/helpers/repository.dart';
import 'package:demotask/modules/post/model/post.dart';
import 'package:hive/hive.dart';

class PostRepository implements Repository<Post> {
  Box<Post> box;

  PostRepository(Box<Post> box) {
    this.box = box;
  }

  @override
  void delete(Post objectToDelete) {
    box.delete(objectToDelete.key);
  }

  @override
  List<Post> getAll() {
    return box.values.toList();
  }

  @override
  void save(Post newObject) async {
    box.add(newObject);
  }
}
