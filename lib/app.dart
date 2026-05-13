import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:ezorrio_dev/resource/settings_repository.dart';
import 'package:ezorrio_dev/resource/data_repository.dart';
import 'package:ezorrio_dev/model/app_theme.dart';
import 'package:ezorrio_dev/ui/page/main_page.dart';
import 'package:ezorrio_dev/ui/page/work_page.dart';
import 'package:ezorrio_dev/ui/page/projects_page.dart';
import 'package:ezorrio_dev/ui/page/education_page.dart';

// ignore: unused_import
import 'package:ezorrio_dev/app_styles.dart';
import 'package:web/web.dart' as web;
import 'dart:js_interop';

class App extends StatefulComponent {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final SettingsRepository settings = SettingsRepository();
  DataRepository? data;
  AppTheme currentTheme = AppTheme.system;

  @override
  void initState() {
    super.initState();
    _loadTheme();
    _loadData();
  }

  Future<void> _loadData() async {
    final repository = await DataRepository.load(readText: _fetchText);
    setState(() {
      data = repository;
    });
  }

  Future<String> _fetchText(String path) async {
    final response = await web.window.fetch(path.toJS).toDart;
    if (!response.ok) {
      throw Exception(
        'Failed to load asset: $path (status ${response.status})',
      );
    }
    final text = await response.text().toDart;
    return text.toDart;
  }

  Future<void> _loadTheme() async {
    final theme = await settings.getTheme();
    _applyTheme(theme);
  }

  void _applyTheme(AppTheme theme) {
    setState(() {
      currentTheme = theme;
    });
    settings.storeThemePreference(theme: theme);

    final isDark =
        theme == AppTheme.dark ||
        (theme == AppTheme.system &&
            web.window.matchMedia('(prefers-color-scheme: dark)').matches);

    if (isDark) {
      web.document.documentElement?.setAttribute('data-theme', 'dark');
    } else {
      web.document.documentElement?.removeAttribute('data-theme');
    }
  }

  void toggleTheme() {
    if (currentTheme == AppTheme.dark) {
      _applyTheme(AppTheme.light);
    } else if (currentTheme == AppTheme.light) {
      _applyTheme(AppTheme.system);
    } else {
      _applyTheme(AppTheme.dark);
    }
  }

  @override
  Component build(BuildContext context) {
    final repository = data;
    if (repository == null) {
      return const div(classes: 'main-layout', [
        div(classes: 'loading', [Component.text('Loading...')]),
      ]);
    }

    return div(classes: 'main-layout', [
      Router(
        routes: [
          ShellRoute(
            builder: (context, state, child) => MainPage(
              data: repository,
              toggleTheme: toggleTheme,
              child: child,
            ),
            routes: [
              Route(
                path: '/',
                builder: (context, state) => WorkPage(data: repository),
              ),
              Route(
                path: '/projects',
                builder: (context, state) => ProjectsPage(data: repository),
              ),
              Route(
                path: '/education',
                builder: (context, state) => EducationPage(data: repository),
              ),
            ],
          ),
        ],
      ),
    ]);
  }
}
