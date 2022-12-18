import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokes_api/controllers/joke_controller.dart';
import 'package:jokes_api/extension/extension.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.put(JokesController());
  HomeScreen({Key? key}) : super(key: key);
  Future init() async {
    await controller.getJokesFromApi();
    controller.getJokes();
  }

  @override
  Widget build(BuildContext context) {
    init();

    return Obx(
      () => Scaffold(
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 10.0.wp),
          child: IconButton(
            icon: Icon(
              Icons.refresh,
              size: 15.0.wp,
            ),
            onPressed: () {
              controller.isVisible(false);
              init();
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: AppBar(
          title: const Text('Jokes'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 3.0.wp, vertical: 5.0.wp),
                  child: Column(
                    children: [
                      Text(
                        controller.setup.value,
                        style: TextStyle(
                          fontSize: 25.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.visible,
                      ),
                      SizedBox(height: 10.0.wp),
                      controller.isVisible.value
                          ? Text(
                              controller.pickup.value,
                              style: TextStyle(
                                fontSize: 25.0.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                              overflow: TextOverflow.visible,
                            )
                          : Container(
                              child: GestureDetector(
                                onTap: () {
                                  controller.visiblePunchline();
                                },
                                child: Text('Tap Me To See.....',
                                    style: TextStyle(
                                      fontSize: 18.0.sp,
                                      color: Colors.green,
                                    )),
                              ),
                            ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
