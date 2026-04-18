import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:ezorrio_dev/model/project.dart';
import 'package:ezorrio_dev/resource/data_repository.dart';

class ProjectsPage extends StatelessComponent {
  final DataRepository data;

  const ProjectsPage({required this.data, super.key});

  Component _projectItem(Project project) {
    final startForm = project.start?.year.toString();
    final endForm = project.end?.year.toString();
    return div(classes: 'card', [
      h3(classes: 'text-title', [
        project.link != null ? a(href: project.link!, attributes: const {'target': '_blank'}, [Component.text(project.title)]) : Component.text(project.title)
      ]),
      p(classes: 'text-caption mb-sm', [Component.text('$startForm - $endForm')]),
      p(classes: 'text-body', [Component.text(project.description)]),
      if (project.tags.isNotEmpty)
        div(classes: 'tags', [
          for (final tag in project.tags)
            span(classes: 'tag', [Component.text(tag)]),
        ]),
    ]);
  }

  @override
  Component build(BuildContext context) {
    return div(classes: 'projects-list', [
      for (final project in data.projects) 
        _projectItem(project),
    ]);
  }
}
