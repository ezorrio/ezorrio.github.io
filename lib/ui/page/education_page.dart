import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:ezorrio_dev/model/education.dart';
import 'package:ezorrio_dev/resource/data_repository.dart';

class EducationPage extends StatelessComponent {
  final DataRepository data;

  const EducationPage({required this.data, super.key});

  Component _educationItem(Education education) {
    final startForm = '${education.start.month.toString().padLeft(2, '0')}/${education.start.year}';
    final isPres = (education.end.year == DateTime.now().year && education.end.month == DateTime.now().month);
    final endForm = isPres ? 'Present' : '${education.end.month.toString().padLeft(2, '0')}/${education.end.year}';
    
    return div(classes: 'card', [
      h3(classes: 'text-title', [Component.text(education.place)]),
      p(classes: 'text-main mb-sm', [Component.text(education.occupation)]),
      p(classes: 'text-caption mb-md', [Component.text('$startForm - $endForm')]),
      p(classes: 'text-body', [Component.text(education.description)]),
    ]);
  }

  @override
  Component build(BuildContext context) {
    return div(classes: 'education-list', [
      for (final ed in data.education)
        _educationItem(ed),
    ]);
  }
}
