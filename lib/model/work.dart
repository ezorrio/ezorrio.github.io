class Work {
  String company;
  String position;
  String? location;
  String? link;
  String? period;
  String? description;
  List<String> tags;
  List<String> screenshots;

  Work({
    required this.company,
    required this.position,
    required this.tags,
    this.location,
    this.link,
    this.period,
    this.description,
    this.screenshots = const [],
  });
}
