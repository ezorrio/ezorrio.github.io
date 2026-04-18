import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:ezorrio_dev/model/work.dart';
import 'package:ezorrio_dev/model/project.dart';
import 'package:ezorrio_dev/resource/data_repository.dart';

class WorkPage extends StatelessComponent {
  final DataRepository data;

  const WorkPage({required this.data, super.key});

  Component _projectItem(Project project) {
    return div(classes: 'mb-sm', [
      p(classes: 'text-title', [Component.text(project.title)]),
      p(classes: 'text-body', [Component.text(project.description)]),
      if (project.tags.isNotEmpty)
        div(classes: 'tags', [
          for (final tag in project.tags)
            span(classes: 'tag', [Component.text(tag)]),
        ]),
    ]);
  }

  Component _workItem(Work work) {
    final startForm = '${work.start?.month.toString().padLeft(2, '0')}/${work.start?.year}';
    final isPres = work.end == null || (work.end!.year == DateTime.now().year && work.end!.month == DateTime.now().month);
    final endForm = isPres ? 'Present' : '${work.end!.month.toString().padLeft(2, '0')}/${work.end!.year}';
    
    return div(classes: 'card', [
      h3(classes: 'text-title', [
        work.link != null ? a(href: work.link!, attributes: const {'target': '_blank'}, [Component.text(work.company)]) : Component.text(work.company)
      ]),
      p(classes: 'text-main mb-sm', [Component.text(work.position)]),
      p(classes: 'text-caption mb-md', [Component.text('$startForm - $endForm')]),
      ...work.projects.map(_projectItem),
    ]);
  }

  @override
  Component build(BuildContext context) {
    return div(classes: 'work-list', [
      for (final work in data.works)
        _workItem(work),
    ]);
  }
}
