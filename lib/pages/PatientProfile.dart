import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/font.dart';
import 'package:comp30022/pages/AbstractConsultationPage.dart';
import 'package:comp30022/components/YellowBorderWhiteCard.dart';
import 'package:comp30022/components/ChatbotButton.dart';

Builder patientProfileBody = Builder(builder: (context) {
  return Container(
    color: AppColors.cream, // Matching cream background color
    padding: const EdgeInsets.only(top: 70, bottom: 60, left: 120, right: 20),
    child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              YellowBorderWhiteCard(
                isShadowOn: true,
                width: 432,
                height: 417,
                child: UserInfoCard(),
              ),
              SizedBox(height: 35),
              YellowBorderWhiteCard(
                isShadowOn: true,
                width: 432,
                height: 244,
                child: AllergiesCard(),
              )
            ],
          ),
          SizedBox(width: 40),
          UserDetailTabs(),
          SizedBox(width: 30),
          ChatBotButton(),
        ]),
  );
});

class PatientProfile extends StatelessWidget {
  static const String routeName = '/PatientProfile';
  const PatientProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return AbstractConsultationPage(
        title: "Patient Profile", pageNum: 1, body: patientProfileBody);
  }
}

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Darlene Pilbara',
              style: TextStyle(
                fontSize: extraLargeFontSize,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            UserInfoRow(
              attribute: 'Gender',
              value: 'Female',
            ),
            UserInfoRow(
              attribute: 'Age',
              value: '24',
            ),
            UserInfoRow(
              attribute: 'Last Contacted',
              value: '01/04/2024',
            ),
            UserInfoRow(
              attribute: 'Languages',
              value: 'Martu Wangka English',
            )
          ],
        ),
      ),
    );
  }
}

class UserInfoRow extends StatelessWidget {
  final String attribute;
  final String value;
  const UserInfoRow({
    super.key,
    required this.attribute,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(attribute,
                style: TextStyle(
                    fontSize: mediumFontSize,
                    color: Colors.black.withOpacity(0.6))),
          ),
          const SizedBox(width: 10),
          Expanded(
              flex: 1,
              child:
                  Text(value, style: const TextStyle(fontSize: mediumFontSize)))
        ],
      ),
    );
  }
}

class AllergiesCard extends StatelessWidget {
  const AllergiesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Allergies',
            style: TextStyle(
              fontSize: extraLargeFontSize,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          const Text('None known', style: TextStyle(fontSize: mediumFontSize)),
          const SizedBox(height: 8),
          Text('+ Add Allergy',
              style: TextStyle(
                  fontSize: mediumFontSize,
                  color: Colors.black.withOpacity(0.6))),
        ],
      ),
    );
  }
}

class UserDetailTabs extends StatefulWidget {
  const UserDetailTabs({super.key});

  @override
  _UserDetailTabsState createState() => _UserDetailTabsState();
}

class _UserDetailTabsState extends State<UserDetailTabs> {
  // Keep track of the currently selected tab
  int _selectedTabIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1153,
      height: 697,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Tabs section
          Transform.translate(
            offset: const Offset(-2.25, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => _onTabSelected(0),
                  child: TabWidget(
                      label: 'General', isSelected: _selectedTabIndex == 0),
                ),
                GestureDetector(
                  onTap: () => _onTabSelected(1),
                  child: TabWidget(
                      label: 'History', isSelected: _selectedTabIndex == 1),
                ),
                GestureDetector(
                  onTap: () => _onTabSelected(2),
                  child: TabWidget(
                      label: 'Family', isSelected: _selectedTabIndex == 2),
                ),
                GestureDetector(
                  onTap: () => _onTabSelected(3),
                  child: TabWidget(
                      label: 'Activity', isSelected: _selectedTabIndex == 3),
                ),
              ],
            ),
          ),
          // Conditionally render content based on selected tab
          Expanded(
            child: Container(
                width: 1153,
                height: 697,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: AppColors.yellowCream,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(14),
                        bottomRight: Radius.circular(14),
                        topRight: Radius.circular(14),
                        topLeft: Radius.circular(0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: const Offset(0, 4),
                        blurRadius: 4, // Match blur radius for consistency
                      ),
                    ]),
                child: _buildTabContent()),
          ),
        ],
      ),
    );
  }

  // Widget that builds the content based on the selected tab
  Widget _buildTabContent() {
    switch (_selectedTabIndex) {
      case 1:
        return _buildHistoryContent();
      case 2:
        return _buildFamilyContent();
      case 3:
        return _buildActivityContent();
      case 0:
      default:
        return _buildGeneralContent();
    }
  }

  Widget _buildGeneralContent() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(14)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Personal Details Table
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Personal details',
                style: TextStyle(
                    fontSize: mediumFontSize,
                    color: Colors.black.withOpacity(0.4)),
              ),
              const SizedBox(height: 15.0),
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(3),
                  1: FlexColumnWidth(3),
                  2: FlexColumnWidth(2),
                  3: FlexColumnWidth(2),
                  4: FlexColumnWidth(3),
                },
                border: TableBorder(
                  horizontalInside: BorderSide(
                      width: 1, color: Colors.black.withOpacity(0.3)),
                ),
                children: [
                  TableRow(children: [
                    Text('Name',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: smallFontSize)),
                    Text('Other names',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: smallFontSize)),
                    Text('Birthdate',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: smallFontSize)),
                    Text('Phone No',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: smallFontSize)),
                    Text('Secondary Phone No(s)',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: smallFontSize)),
                  ]),
                  const TableRow(children: [
                    Text('Darlene', style: TextStyle(fontSize: smallFontSize)),
                    Text('', style: TextStyle(fontSize: smallFontSize)),
                    Text('01/01/1980',
                        style: TextStyle(fontSize: smallFontSize)),
                    Text('0412 345 678',
                        style: TextStyle(fontSize: smallFontSize)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('0412 345 678',
                            style: TextStyle(fontSize: smallFontSize)),
                        Text('0498 765 432',
                            style: TextStyle(fontSize: smallFontSize)),
                      ],
                    ),
                  ]),
                ],
              ),
            ],
          ),

          // Key Notes Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Key notes',
                style: TextStyle(
                    fontSize: mediumFontSize,
                    color: Colors.black.withOpacity(0.4)),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Knee and back pain, difficulty breathing during exercise, semi-frequent heart palpitations',
                style: TextStyle(fontSize: smallFontSize),
              ),
            ],
          ),

          // Prescriptions Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Prescriptions',
                style: TextStyle(
                    fontSize: mediumFontSize,
                    color: Colors.black.withOpacity(0.4)),
              ),
              const SizedBox(height: 15.0),
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(3),
                  1: FlexColumnWidth(3),
                  2: FlexColumnWidth(1.5),
                  3: FlexColumnWidth(1.5),
                  4: FlexColumnWidth(1.5),
                  5: FlexColumnWidth(2),
                },
                border: TableBorder(
                  horizontalInside: BorderSide(
                      width: 1, color: Colors.black.withOpacity(0.3)),
                ),
                children: [
                  TableRow(children: [
                    Text('Brand Name',
                        style: TextStyle(
                            fontSize: smallFontSize,
                            color: Colors.black.withOpacity(0.5))),
                    Text('Generic Name',
                        style: TextStyle(
                            fontSize: smallFontSize,
                            color: Colors.black.withOpacity(0.5))),
                    Text('Strength',
                        style: TextStyle(
                            fontSize: smallFontSize,
                            color: Colors.black.withOpacity(0.5))),
                    Text('Frequency',
                        style: TextStyle(
                            fontSize: smallFontSize,
                            color: Colors.black.withOpacity(0.5))),
                    Text('Form',
                        style: TextStyle(
                            fontSize: smallFontSize,
                            color: Colors.black.withOpacity(0.5))),
                    Text('Date Prescribed',
                        style: TextStyle(
                            fontSize: smallFontSize,
                            color: Colors.black.withOpacity(0.5))),
                  ]),
                  const TableRow(children: [
                    Text(
                      'Norvasc',
                      style: TextStyle(fontSize: smallFontSize),
                    ),
                    Text('Amlodipine',
                        style: TextStyle(fontSize: smallFontSize)),
                    Text('5mg', style: TextStyle(fontSize: smallFontSize)),
                    Text('1/Day', style: TextStyle(fontSize: smallFontSize)),
                    Text('Tab', style: TextStyle(fontSize: smallFontSize)),
                    Text('24/03/2024',
                        style: TextStyle(fontSize: smallFontSize)),
                  ]),
                ],
              ),
              const SizedBox(height: 100.0),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryContent() {
    return const Text("");
  }

  Widget _buildFamilyContent() {
    return const Padding(
      padding: EdgeInsets.all(40.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: 700,
          height: 500,
          child: Column(
            children: [
              UserInfoRow(attribute: "Language Group", value: "Martu"),
              UserInfoRow(attribute: "Country/Land", value: "Martu"),
              UserInfoRow(attribute: "Next of Kin", value: "Aunt Mary"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActivityContent() {
    return const Text("");
  }
}

class TabWidget extends StatelessWidget {
  final String label;
  final bool isSelected;

  const TabWidget({super.key, required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.yellowCream
              : AppColors.yellowCream.withOpacity(0.6),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(14), topRight: Radius.circular(14)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Text(
          label,
          style: TextStyle(
            fontSize: mediumFontSize,
            color: isSelected ? Colors.black : Colors.grey[600],
          ),
        ),
      ),
    );
  }
}
