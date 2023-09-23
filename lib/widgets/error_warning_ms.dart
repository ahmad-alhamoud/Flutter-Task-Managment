import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goapp/utils/app_colors.dart';

class Message {
  static void taskErrorWarning(String taskName, String taskErrorOrWarning) {
      Get.snackbar(
      taskName,
      taskErrorOrWarning,
      backgroundColor: AppColors.mainColor,
      titleText:  Text(
        taskName ,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold ,
          color: Colors.white
        ),
      ) ,
      messageText:  Text(
      taskErrorOrWarning ,
      style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold ,
          color: Colors.amber
      ),
    )
    );
  }
}
