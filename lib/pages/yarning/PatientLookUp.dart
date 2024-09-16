import 'package:comp30022/components/YellowBorderWhiteCard.dart';
import 'package:comp30022/pages/Pages.dart';
import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/font.dart';

Builder patientLookUpBody = Builder(builder: (context) {
  return Container(
    color: AppColors.cream,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            YellowBorderWhiteCard(
              isShadowOn: true,
              width: 1718,
              height: 600,
              child: _buildLookUpTable(),
            ),
          ],
        ),
      ],
    ),
  );
});

Widget _buildLookUpTable() {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(50)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          // Table header
          children: [
            Table(
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(2),
                2: FlexColumnWidth(2),
                3: FlexColumnWidth(2),
                4: FlexColumnWidth(2),
              },
              border: TableBorder(
                horizontalInside:
                    BorderSide(width: 1, color: Colors.black.withOpacity(0.3)),
              ),
              children: const [
                TableRow(
                    decoration: BoxDecoration(
                      color: AppColors.yellowCream,
                    ),
                    children: [
                      Text(
                        'Name',
                        style: TextStyle(
                            color: Colors.black, fontSize: largeFontSize),
                        textAlign: TextAlign.center,
                      ),
                      Text('Alias',
                          style: TextStyle(
                              color: Colors.black, fontSize: largeFontSize),
                          textAlign: TextAlign.center),
                      Text('Date of Birth',
                          style: TextStyle(
                              color: Colors.black, fontSize: largeFontSize),
                          textAlign: TextAlign.center),
                      Text('Sex',
                          style: TextStyle(
                              color: Colors.black, fontSize: largeFontSize),
                          textAlign: TextAlign.center),
                      Text('Number',
                          style: TextStyle(
                              color: Colors.black, fontSize: largeFontSize),
                          textAlign: TextAlign.center),
                    ]),
              ],
            ),
          ],
        ),
        // Scrollable rows
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(2),
                  3: FlexColumnWidth(2),
                  4: FlexColumnWidth(2),
                },
                border: TableBorder(
                  horizontalInside: BorderSide(
                    width: 1,
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
                children: _buildTableRows(),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

List<TableRow> _buildTableRows() {
  return [
    const TableRow(children: [
      Text(
        'Darlene Pilbara',
        style: TextStyle(fontSize: smallFontSize),
        textAlign: TextAlign.center,
      ),
      Text('N/A',
          style: TextStyle(fontSize: smallFontSize),
          textAlign: TextAlign.center),
      Text('01/01/2001',
          style: TextStyle(fontSize: smallFontSize),
          textAlign: TextAlign.center),
      Text('Female',
          style: TextStyle(fontSize: smallFontSize),
          textAlign: TextAlign.center),
      Text('N/A',
          style: TextStyle(fontSize: smallFontSize),
          textAlign: TextAlign.center),
    ]),
  ];
}

class PatientLookUp extends StatelessWidget {
  const PatientLookUp({super.key});

  @override
  Widget build(BuildContext context) {
    return AbstractConsultationPage(
        title: "Existing Patient", pageNum: 1, body: patientLookUpBody);
  }
}
