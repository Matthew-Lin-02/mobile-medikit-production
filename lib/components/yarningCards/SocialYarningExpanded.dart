import 'package:comp30022/font.dart';
import 'package:flutter/material.dart';
import 'package:comp30022/components/MedicalHistorySubItem.dart';

class SocialYarningCardContent extends StatefulWidget {
  const SocialYarningCardContent({super.key});

  @override
  _SocialYarningCardContentState createState() =>
      _SocialYarningCardContentState();
}

class _SocialYarningCardContentState extends State<SocialYarningCardContent> {
  // Map to store checkbox states
  Map<String, bool> checkboxStates = {
    'healthPrioritiesWorries': false,
    'healthyEatingWorries': false,
    'foodAvailabilityWorriesYes': false,
    'foodAvailabilityWorriesNo': false,
    'physicalActivityWorriesYes': false,
    'physicalActivityWorriesNo': false,
    'stableHousingYes': false,
    'stableHousingNo': false,
    'safeAtHomeYes': false,
    'safeAtHomeNo': false,
    'studyingYes': false,
    'studyingNo': false,
    'workingYes': false,
    'workingNo': false,
  };

  void updateCheckbox(String key, bool? value) {
    setState(() {
      checkboxStates[key] = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              const MedicalHistorySubItem(
                title: "Current health priorities and worries",
                description:
                    "Any patient health stories or current worries/problems.",
              ),
              const SizedBox(height: 16),
              const MedicalHistorySubItem(
                title: "Healthy eating and exercise",
                description:
                    "Any worries with diet and/or age-appropriate eating?",
              ),
              const SizedBox(width: 16),
              _buildCheckboxFieldWithDetails(
                context,
                "Any worries about availability of food?",
                "Yes",
                "No",
                "Is there enough food to eat? How much veggies, meat, and bread do you eat? What do you usually eat?",
                'foodAvailabilityWorriesYes',
                'foodAvailabilityWorriesNo',
              ),
              const SizedBox(width: 16),
              _buildCheckboxFieldWithDetails(
                context,
                "Any worries about physical activity?",
                "Yes",
                "No",
                "Do you like playing sports? What sports do you play? How far do you walk each day? From where to where?",
                'physicalActivityWorriesYes',
                'physicalActivityWorriesNo',
              ),
              const SizedBox(height: 26),
              const MedicalHistorySubItem(
                title: "Social Connection",
                description:
                    "Supporting teams and clubs, hobbies with others and involvement within the community.",
                maxLines: 6,
              ),
            ],
          ),
        ),
        const SizedBox(width: 24), // Space between the two columns
        Expanded(
          child: Column(
            children: [
              _buildStudyAndWorkFields(context),
              const SizedBox(height: 16),
              const MedicalHistorySubItem(
                title: "Family and housing",
                description: "Who does the patient live with?",
              ),
              const SizedBox(height: 16),
              Row(children: [
                Expanded(
                  child: _buildCheckboxFieldWithDetails(
                    context,
                    "Does the patient have stable housing?",
                    "Yes",
                    "No",
                    "What is living at home like?",
                    'stableHousingYes',
                    'stableHousingNo',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildCheckboxFieldWithDetails(
                    context,
                    "Does the patient feel safe at home?",
                    "Yes",
                    "No",
                    "Are you happy and safe at home?",
                    'safeAtHomeYes',
                    'safeAtHomeNo',
                  ),
                ),
              ]),
              const SizedBox(height: 16),
              const MedicalHistorySubItem(
                title:
                    "Any particularly stressful life events impacting patient or their health?",
                description:
                    "Has anything happened that made you really worried or sick?",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCheckboxFieldWithDetails(
    BuildContext context,
    String title,
    String option1,
    String option2,
    String detailsDescription,
    String option1Key,
    String option2Key,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCheckboxField(
            context, title, option1, option2, option1Key, option2Key),
        const SizedBox(height: 8),
        MedicalHistorySubItem(
          title: "Details:",
          description: detailsDescription,
        ),
      ],
    );
  }

  Widget _buildCheckboxField(
    BuildContext context,
    String title,
    String option1,
    String option2,
    String option1Key,
    String option2Key,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: extraSmallFontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 32),
            Checkbox(
              value: checkboxStates[option1Key],
              onChanged: (bool? value) {
                updateCheckbox(option1Key, value);
              },
            ),
            Text(option1),
            const SizedBox(
                width: 16), // Add space between the checkboxes and their labels
            Checkbox(
              value: checkboxStates[option2Key],
              onChanged: (bool? value) {
                updateCheckbox(option2Key, value);
              },
            ),
            Text(option2),
          ],
        ),
      ],
    );
  }

  Widget _buildStudyAndWorkFields(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Study and work",
          style: TextStyle(
            fontSize: extraSmallFontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: _buildCheckboxFieldWithDetails(
                context,
                "Studying or seeking to study?",
                "Yes",
                "No",
                "Are you studying anything right now?",
                'studyingYes',
                'studyingNo',
              ),
            ),
            const SizedBox(width: 16), // Space between the two columns
            Expanded(
              child: _buildCheckboxFieldWithDetails(
                context,
                "Working or seeking to work?",
                "Yes",
                "No",
                "Are you working?",
                'workingYes',
                'workingNo',
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const MedicalHistorySubItem(
          title:
              "Additional details (Occupational hazards, training, disability etc.)",
          description: "Is there anything that makes your work hard to do?",
        ),
      ],
    );
  }
}
