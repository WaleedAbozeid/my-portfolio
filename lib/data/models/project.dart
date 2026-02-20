class Project {
  final String id;
  final String title;
  final String description;
  final String fullDescription;
  final List<String> images;
  final List<String> techStack;
  final String category;
  final String? githubUrl;
  final String? liveUrl;
  final String? downloadUrl; // رابط تحميل APK
  final String? appStoreUrl; // رابط App Store (iOS)
  final String? playStoreUrl; // رابط Play Store (Android)
  final DateTime date;

  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.fullDescription,
    required this.images,
    required this.techStack,
    required this.category,
    required this.date,
    this.githubUrl,
    this.liveUrl,
    this.downloadUrl,
    this.appStoreUrl,
    this.playStoreUrl,
  });
}
