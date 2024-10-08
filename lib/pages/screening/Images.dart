import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/font.dart';
import 'package:comp30022/components/ChatbotButton.dart';
import 'package:comp30022/pages/AbstractConsultationPage.dart';
import 'package:comp30022/pages/screening/ThroatSnapshotAnalysis.dart';
import 'package:comp30022/pages/screening/SkinSnapshotAnalysis.dart';

class Images extends StatefulWidget {
  const Images({super.key});

  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
              fontSize: mediumFontSize, // Larger font for selected tab
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
      length: 2,
      child: AbstractConsultationPage(
        title: "Images",
        pageNum: 3,
        body: Stack(
          children: [
            Column(
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
                      _buildTab('Throat Snapshot Analysis', 0),
                      _buildTab('Skin Snapshot Analysis', 1),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      ThroatSnapshotAnalysis(),
                      SkinSnapshotAnalysis(),
                    ],
                  ),
                ),
              ],
            ),
            const Positioned(right: 30.0, top: 90.0, child: ChatBotButton()),
            const Positioned(
                bottom: 0,
                child: Image(
                    image: AssetImage('assets/images/art/footer-strip.png'))),
          ],
        ),
      ),
    );
  }
}
