class Project {
  String title;
  String description;
  String? role;
  String? period;
  String? link;
  List<String> tags;

  Project({
    required this.title,
    required this.description,
    required this.tags,
    this.role,
    this.link,
    this.period,
  });
}
