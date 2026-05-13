import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:ezorrio_dev/model/education.dart';
import 'package:ezorrio_dev/resource/data_repository.dart';

class EducationPage extends StatelessComponent {
  final DataRepository data;

  const EducationPage({required this.data, super.key});

  Component _educationItem(Education education) => div(classes: 'card', [
    h3(classes: 'text-title', [Component.text(education.place)]),
    p(classes: 'text-main mb-sm', [Component.text(education.occupation)]),
    if (education.period != null)
      p(classes: 'text-caption mb-md', [Component.text(education.period!)]),
    if (education.description != null)
      p(classes: 'text-body', [Component.text(education.description!)]),
  ]);

  @override
  Component build(BuildContext context) => div(classes: 'education-list', [
    for (final ed in data.education) _educationItem(ed),
  ]);
}
