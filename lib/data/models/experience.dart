class Experience {
  final String title;
  final String organization;
  final String description;
  final DateTime startDate;
  final DateTime? endDate;
  final List<String> skills;

  const Experience({
    required this.title,
    required this.organization,
    required this.description,
    required this.startDate,
    this.endDate,
    required this.skills,
  });
}
