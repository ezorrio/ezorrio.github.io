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

class App extends StatefulComponent {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final SettingsRepository settings = SettingsRepository();
  final DataRepository data = DataRepository();
  AppTheme currentTheme = AppTheme.system;

  @override
  void initState() {
    super.initState();
    _loadTheme();
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
    
    final isDark = theme == AppTheme.dark || 
                   (theme == AppTheme.system && web.window.matchMedia('(prefers-color-scheme: dark)').matches);
    
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
    return div(classes: 'main-layout', [
      Router(
        routes: [
          ShellRoute(
            builder: (context, state, child) => MainPage(
              data: data,
              toggleTheme: toggleTheme,
              child: child,
            ),
            routes: [
              Route(path: '/', builder: (context, state) => WorkPage(data: data)),
              Route(path: '/projects', builder: (context, state) => ProjectsPage(data: data)),
              Route(path: '/education', builder: (context, state) => EducationPage(data: data)),
            ],
          ),
        ],
      )
    ]);
  }
}
