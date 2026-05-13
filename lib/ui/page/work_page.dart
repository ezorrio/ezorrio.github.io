import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:ezorrio_dev/model/work.dart';
import 'package:ezorrio_dev/resource/data_repository.dart';

class WorkPage extends StatelessComponent {
  final DataRepository data;

  const WorkPage({required this.data, super.key});

  Component _workItem(Work work) {
    return div(classes: 'card', [
      div(classes: 'card-header', [
        div([
          h3(classes: 'text-title', [
            work.link != null
                ? a(href: work.link!, attributes: const {'target': '_blank'}, [Component.text(work.company)])
                : Component.text(work.company),
          ]),
          p(classes: 'text-subtitle', [Component.text(work.position)]),
          if (work.location != null)
            p(classes: 'text-caption', [
              Component.text(work.location!),
            ]),
        ]),
        if (work.period != null)
          div(classes: 'card-meta', [
            p(classes: 'text-caption', [Component.text(work.period!)]),
          ]),
      ]),
      if (work.description != null)
        p(classes: 'text-body', [Component.text(work.description!)]),
      if (work.tags.isNotEmpty)
        div(classes: 'tags', [
          for (final tag in work.tags) span(classes: 'tag', [Component.text(tag)]),
        ]),
    ]);
  }

  @override
  Component build(BuildContext context) {
    return div(classes: 'work-list', [
      for (final work in data.works) _workItem(work),
    ]);
  }
}
