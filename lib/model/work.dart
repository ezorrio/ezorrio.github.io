import 'package:ezorrio_dev/model/project.dart';

class Work {
  String company;
  String position;
  String? link;
  String? period;
  List<Project> projects;

  Work({
    required this.company,
    required this.projects,
    required this.position,
    this.link,
    this.period,
  });
}
