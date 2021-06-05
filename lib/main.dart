import 'package:demotask/di.dart';
import 'package:demotask/modules/post/model/post.dart';
import 'package:demotask/modules/task/root.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(PostAdapter());
  await setupPostModuleService(ioc);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          // appBar: AppBar(title: Text("Post List")),
          body: TaskRootWidget(),
        ));
  }
}
