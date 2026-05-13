class Project {
  String title;
  String description;
  String? period;
  String? link;
  List<String> tags;

  Project({
    required this.title,
    required this.description,
    required this.tags,
    this.link,
    this.period,
  });
}
