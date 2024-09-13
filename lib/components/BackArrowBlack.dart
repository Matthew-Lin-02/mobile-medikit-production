import 'package:flutter/material.dart';

class BackArrowBlack extends StatelessWidget {
  const BackArrowBlack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 0,
        right: 20,
        left: 20,
        bottom: 25,
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: const Color.fromRGBO(15, 13, 11, 1.0), width: 2.5),
        ),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: const Color.fromRGBO(15, 13, 11, 1.0),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}
