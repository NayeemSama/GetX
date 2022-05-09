import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Dialog {
  showDialog({String? title = 'Error', String? description = 'Something went wrong'}) {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.pink,
        actionsAlignment: MainAxisAlignment.center,
        alignment: Alignment.bottomRight,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        title: Text('$title'),
        content: Text('$description'),
        actions: <Widget>[
          TextButton(
            onPressed: () => {},
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => {},
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
