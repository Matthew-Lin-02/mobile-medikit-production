class CardData {
  final String title;
  final String description;
  final Map<String, List<String>> subtitleItemMap;

  CardData({
    required this.title,
    required this.description,
    required this.subtitleItemMap,
  });
}

CardData socialYarningCardData = CardData(
  title: 'Social Yarning',
  description:
      'Building Mutual Understanding, Trust, finding a Common Ground and Exchanging Life Experiences. ',
  subtitleItemMap: {
    "Consider Sharing": [
      "Where are you from? Where are they from?",
      "Sharing about your family and your cultural/locational roots, pictures about your hometown or people.",
      "Local area you live in, any places close by you like.",
      "Any interests or hobbies.",
      "Any recent events that may interest the patient, e.g., AFL matches, worldwide events."
    ],
    "Actively Listen for": [
      "Patients social connection with the community eg. team sports or clubs, hobbies shared with others",
      "Patient’s health stories, worries and medical history",
      "Patient’s education journey or work",
      "Patient’s family or housing situation eg. Need of financial aid?"
    ],
  },
);

CardData clinicalDiagnosticYarningCardData = CardData(
  title: 'Clinical/Diagnostic Yarning',
  description:
      'Sharing healthcare knowledge and and actively listening to patient stories.',
  subtitleItemMap: {
    "Consider Sharing": [
      "How the heart functions, symptoms and reasons for common  cardiovascular problems. Eg. Angina, coronary heart disease",
      "Common diabetic facts and symptoms",
      "Symptoms and worsening signs of rheumatic fever",
      "Symptoms of strep throat and other oral problems",
      "Symptoms and how to identify skin scabies and Tinea",
      "Effects of malnutrition and how it can look like",
      "Importance of exercise and what it does to the body"
    ],
    "Actively Listen for": [
      "Patient health stories eg. They had a period of fast heartbeats and heavy breathing        last week.",
      "Any way that the patient relates to the knowledge you shared"
    ],
  },
);
