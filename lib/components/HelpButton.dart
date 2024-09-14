import 'package:flutter/material.dart';

class HelpButton extends StatelessWidget {
  const HelpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: const Color.fromRGBO(15, 13, 11, 1.0), width: 2.5),
          ),
          child: IconButton(
            onPressed: () {
              ;
            },
            color: const Color.fromRGBO(15, 13, 11, 1.0),
            iconSize: 33,
            icon: const Icon(Icons.question_mark),
          ),
        ),
        const Text("Help",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
      ],
    );
  }
}
