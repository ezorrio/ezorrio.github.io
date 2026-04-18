import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:ezorrio_dev/resource/data_repository.dart';
import 'package:ezorrio_dev/ui/widget/profile_header.dart';
// import 'dart:html' as html; // We can use web.window.location.pathname if needed
import 'package:web/web.dart' as web;

class MainPage extends StatefulComponent {
  final DataRepository data;
  final VoidCallback toggleTheme;
  final Component child;

  const MainPage({
    required this.data,
    required this.toggleTheme,
    required this.child,
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  bool _isPath(String path) {
    try {
      return web.window.location.pathname == path;
    } catch (_) {
      return false;
    }
  }

  @override
  Component build(BuildContext context) {
    final isWork = _isPath('/');
    final isProj = _isPath('/projects');
    final isEducation = _isPath('/education');

    return div(classes: 'page-wrapper', [
      ProfileHeader(
        data: component.data,
        toggleTheme: component.toggleTheme,
      ),
      div(classes: 'tabs', [
        Link(to: '/', classes: 'tab ${isWork ? "active" : ""}', child: const Component.text('Work')),
        Link(to: '/projects', classes: 'tab ${isProj ? "active" : ""}', child: const Component.text('Projects')),
        Link(to: '/education', classes: 'tab ${isEducation ? "active" : ""}', child: const Component.text('Education')),
      ]),
      div(classes: 'router-content', [
        component.child
      ]),
    ]);
  }
}
