import 'package:demotask/modules/task/model/task.dart';
import 'package:demotask/modules/task/service/task_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

class MockTaskService extends Mock implements TaskService {}

void main() async {
  // Task List
  Task task1 = Task(
      name: "Get an iPhone",
      description: "I'm gonna get an iPhone very soon",
      id: Uuid().v4());

  Task task2 = Task(
      name: "Secure a flutter job",
      description: "I willbe getting a flutter job very soon",
      id: Uuid().v4());

  group("test all access to firestore", () {
    test("it should create task into firestore", () {});
  });
}
