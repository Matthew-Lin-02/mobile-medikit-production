import 'package:flutter/material.dart';

void showCustomModal(BuildContext context, Widget widget) {
  showDialog(
    context: context,
    barrierColor: const Color.fromARGB(40, 0, 0, 0),
    barrierDismissible: true, // Allows clicking outside to dismiss
    builder: (BuildContext context) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).pop(); // Dismiss when clicking outside
        },
        child: Center(
          child: GestureDetector(
            onTap: () {}, // Prevents modal dismissal when clicking inside
            child: widget,
          ),
        ),
      );
    },
  );
}

void showCustomModalRightCorner(BuildContext context, Widget widget) {
  showDialog(
    context: context,
    barrierColor: const Color.fromARGB(0, 0, 0, 0),
    barrierDismissible: true, // Allows clicking outside to dismiss
    builder: (BuildContext context) {
      return GestureDetector(
          onTap: () {
            Navigator.of(context).pop(); // Dismiss when clicking outside
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20, right: 20),
            child: Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {}, // Prevents modal dismissal when clicking inside
                child: widget,
              ),
            ),
          ));
    },
  );
}
