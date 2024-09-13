import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/config.dart';
import 'package:comp30022/font.dart';

class YellowCard extends StatefulWidget {
  const YellowCard({
    super.key,
    required this.cardData,
    required this.cardContentExpanded,
  });

  final Widget cardContentExpanded;
  final CardData cardData;

  @override
  YellowCardState createState() => YellowCardState();
}

class YellowCardState extends State<YellowCard> {
  bool expanded = false;

  void switchState() {
    setState(() {
      expanded = !expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.yellowCream,
      elevation: 6.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.cardData.title,
              style: const TextStyle(fontSize: largeFontSize),
            ),
            if (expanded)
              Column(children: [
                CardContentClosed(
                  subtitleItemMap: widget.cardData.subtitleItemMap,
                ),
                const SizedBox(height: 32),
                widget.cardContentExpanded
              ])
            else
              CardContentClosed(
                subtitleItemMap: widget.cardData.subtitleItemMap,
              ),
            CenteredArrowExpansionTile(onTap: switchState),
          ],
        ),
      ),
    );
  }
}

class CardContentClosed extends StatelessWidget {
  final Map<String, List<String>> subtitleItemMap;

  const CardContentClosed({
    super.key,
    required this.subtitleItemMap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (subtitleItemMap.isNotEmpty)
          ...subtitleItemMap.entries.map((entry) {
            List<String> items = entry.value;
            int splitIndex = (items.length / 2).ceil();

            return Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.key, // Subtitle
                    style: TextStyle(
                      fontSize: mediumFontSize,
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: items
                              .sublist(0, splitIndex)
                              .map((item) => BulletedList.buildListItem(item))
                              .toList(),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          children: items
                              .sublist(splitIndex)
                              .map((item) => BulletedList.buildListItem(item))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            );
          }),
      ],
    );
  }
}

class BulletedList {
  static Widget buildListItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(" • ", style: TextStyle(fontSize: mediumFontSize)),
        const SizedBox(width: 8),
        Expanded(
            child: Text(
          text,
          style: const TextStyle(fontSize: mediumFontSize),
        )),
      ],
    );
  }
}

class CenteredArrowExpansionTile extends StatefulWidget {
  final VoidCallback onTap;

  const CenteredArrowExpansionTile({super.key, required this.onTap});

  @override
  CenteredArrowExpansionTileState createState() =>
      CenteredArrowExpansionTileState();
}

class CenteredArrowExpansionTileState
    extends State<CenteredArrowExpansionTile> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _expanded = !_expanded;
        });
        widget.onTap(); // Call the onTap callback passed from parent
      },
      child: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              child: Icon(
                _expanded ? Icons.expand_less : Icons.expand_more,
                size: 70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
