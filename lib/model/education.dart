class Education {
  String place;
  String occupation;
  String? location;
  String? description;
  String? period;

  Education({
    required this.place,
    required this.occupation,
    this.location,
    this.description,
    this.period,
  });
}
