import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demotask/config/app_config.dart';
import 'package:demotask/modules/task/model/task.dart';

class TaskService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> save(Task task) {
    return _db
        .collection(AppConfig.taskCollectionName)
        .doc(task.id)
        .set(task.toJson())
        .catchError((error) => throw Error());
  }

  Future<Stream<QuerySnapshot>> getTasks() async {
    return await _db.collection(AppConfig.taskCollectionName).snapshots();
  }

  Future<void> updateTask(Task task) {
    _db
        .collection(AppConfig.taskCollectionName)
        .doc(task.id)
        .update(task.toJson())
        .catchError(throw Error());
  }

  Future<void> deleteTask(Task task) {
    return _db
        .collection(AppConfig.taskCollectionName)
        .doc(task.id)
        .delete()
        .catchError(throw Error());
  }
}
