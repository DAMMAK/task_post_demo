import 'package:demotask/modules/post/model/post.dart';
import 'package:hive/hive.dart';

class PostBox {
  var box = Hive.openBox<Post>("posts");
}
