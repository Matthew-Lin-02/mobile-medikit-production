import 'package:flutter/material.dart';
import 'package:comp30022/pages/AbstractConsultationPage.dart';

class Results extends StatelessWidget {
  const Results({super.key});

  @override
  Widget build(BuildContext context) {
    return AbstractConsultationPage(
        title: "Results", pageNum: 4, body: const Center());
  }
}
