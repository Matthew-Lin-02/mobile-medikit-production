import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/styles.dart';

class ScreeningTools extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final containerWidth = context.screenWidth * 0.80;
    return Center(
      child: Container(
        width: containerWidth,
        color: AppColors.cream,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                "Here are some tools to assist with the checkup.",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  shrinkWrap:
                      true, // Stops the GridView from expanding unnecessarily
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 75,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2.5,
                  children: const [
                    // Vitals Section
                    SectionCard(
                      sectionTitle: "Vitals",
                      tools: [
                        ToolCard(
                          icon: Icons.search,
                          label: "Observations",
                          status: "Incomplete",
                        ),
                        ToolCard(
                          icon: Icons.thermostat,
                          label: "Temperature",
                          status: "Incomplete",
                        ),
                        ToolCard(
                          icon: Icons.favorite,
                          label: "Blood Pressure",
                          status: "Incomplete",
                        ),
                        // ToolCard(
                        //   icon: Icons.image,
                        //   label: "Image",
                        //   status: "Incomplete",
                        // ),
                      ],
                    ),
                    // Cardiovascular Section
                    SectionCard(
                      sectionTitle: "Cardiovascular",
                      tools: [
                        ToolCard(
                          icon: Icons.assessment,
                          label: "CVD Risk Assessment",
                          status: "Incomplete",
                        ),
                        ToolCard(
                          icon: Icons.monitor_heart,
                          label: "ECG Test",
                          status: "Incomplete",
                        ),
                        ToolCard(
                          icon: Icons.accessibility,
                          label: "Ankle Brachial Index",
                          status: "Incomplete",
                        ),
                      ],
                    ),
                    // Renal Section
                    SectionCard(
                      sectionTitle: "Renal",
                      tools: [
                        ToolCard(
                          icon: Icons.science,
                          label: "Urinalysis",
                          status: "Incomplete",
                        ),
                      ],
                    ),
                    // Endocrine Section
                    SectionCard(
                      sectionTitle: "Endocrine",
                      tools: [
                        ToolCard(
                          icon: Icons.bloodtype,
                          label: "Blood Glucose",
                          status: "Incomplete",
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Continue Button
              ElevatedButton.icon(
                onPressed: () {
                  // Handle navigation to Results
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text("Continue to Results"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.brown,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionCard extends StatelessWidget {
  final String sectionTitle;
  final List<Widget> tools;

  const SectionCard({
    Key? key,
    required this.sectionTitle,
    required this.tools,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(14)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-4, 4),
              spreadRadius: -2,
              blurRadius: 2,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(4, 4),
              spreadRadius: -2,
              blurRadius: 2,
            ),
            BoxShadow(
              spreadRadius: -4.0,
              blurRadius: 4,
              color: Colors.white,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  sectionTitle,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Expanded(flex: 1, child: SizedBox.shrink()),
              Expanded(
                flex: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: tools,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ToolCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String status;

  const ToolCard({
    Key? key,
    required this.icon,
    required this.label,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.cream,
      width: context.screenWidth * 0.078,
      height: context.screenHeight * 0.133,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: Colors.brown),
            const SizedBox(height: 10),
            Text(label),
            const SizedBox(height: 5),
            Text(
              status,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
