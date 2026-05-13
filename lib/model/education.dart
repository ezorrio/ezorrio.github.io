class Education {
  String place;
  String occupation;
  String? description;
  String? period;

  Education({
    required this.place,
    required this.occupation,
    required this.description,
    this.period,
  });
}
