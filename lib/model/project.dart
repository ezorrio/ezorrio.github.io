class Project {
  String title;
  String description;
  String? role;
  String? period;
  String? link;
  List<String> tags;
  List<String> screenshots;

  Project({
    required this.title,
    required this.description,
    required this.tags,
    this.role,
    this.link,
    this.period,
    this.screenshots = const [],
  });
}
