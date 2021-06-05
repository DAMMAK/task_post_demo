import 'package:flutter/material.dart';

class AppConfig {
  static String baseUrl = "https://jsonplaceholder.typicode.com/";
  static String getPostUrl = "posts";
  static String taskCollectionName = "tasks";
}

getTextSize(BuildContext context, {double size = 16}) {
  return MediaQuery.of(context).size.height * (size / 1000);
}
