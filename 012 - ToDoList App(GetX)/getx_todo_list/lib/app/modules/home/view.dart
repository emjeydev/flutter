import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_list/app/core/utils/extentions.dart';
import 'package:getx_todo_list/app/modules/home/controller.dart';
import 'package:getx_todo_list/app/modules/home/widgets/add_card.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(4.0.sp),
                child: Text(
                  "My List",
                  style: TextStyle(
                    fontSize: 24.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
