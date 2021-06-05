import 'package:demotask/config/app_color.dart';
import 'package:demotask/modules/post/root.dart';
import 'package:demotask/modules/task/root.dart';
import 'package:demotask/utils/helpers/route_animation.dart';
import 'package:demotask/utils/widgets/button.dart';
import 'package:flutter/material.dart';

class Selelction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Click here for the first Assessment"),
              SizedBox(height: 10),
              MyButton(
                color: AppColors.errorColor,
                onTap: () {
                  Navigator.of(context).push(FadeRoute(page: PostWidget()));
                },
                height: 50.0,
                width: double.infinity,
                title: "Post",
              ),
              SizedBox(height: 30),
              Text("Click here for the second Assessment"),
              SizedBox(height: 10),
              MyButton(
                color: AppColors.errorColor,
                onTap: () {
                  Navigator.of(context).push(FadeRoute(page: TaskRootWidget()));
                },
                height: 50.0,
                width: double.infinity,
                title: "Todo",
              )
            ],
          ),
        ),
      ),
    );
  }
}
