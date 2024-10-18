import 'package:comp30022/color.dart';
import 'package:flutter/material.dart';
import 'package:comp30022/pages/AbstractConsultationPage.dart';
import 'package:comp30022/pages/results/ObservationsAndVitalSign.dart';
import 'package:comp30022/pages/results/ECGResults.dart';
import 'package:comp30022/pages/results/ImageAnalysisResults.dart';

class Results extends StatefulWidget {
  const Results({super.key});

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildTab(String text, int index) {
    bool isSelected = _tabController.index == index;
    return Expanded(
      child: InkWell(
        onTap: () {
          _tabController.animateTo(index);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color:
                isSelected ? AppColors.cream.withOpacity(0.7) : AppColors.cream,
            border: Border(
              bottom: BorderSide(
                color: isSelected ? Colors.black45 : Colors.transparent,
                width: 3, // Increased width for visibility
              ),
            ),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24, // Larger font for selected tab
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : Colors.black54,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: AbstractConsultationPage(
        title: "Results",
        pageNum: 4,
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.cream,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.shade300,
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                children: [
                  _buildTab('Observations and Vital Sign', 0),
                  _buildTab('ECG Results', 1),
                  _buildTab('Image Analysis Results', 2),
                  _buildTab('Urinalysis Results', 3),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  ObservationsAndVitalSign(),
                  ECGResults(),
                  ImageAnalysisResults(),
                  Center(child: Text('Urinalysis Results Content')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
