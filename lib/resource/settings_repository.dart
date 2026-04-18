import 'package:ezorrio_dev/model/app_theme.dart';
import 'package:web/web.dart';

class SettingsRepository {
  Future<bool> storeThemePreference({required AppTheme theme}) async {
    window.localStorage.setItem('theme', theme.index.toString());
    return true;
  }

  Future<AppTheme> getTheme() async {
    final val = window.localStorage.getItem('theme');
    if (val != null) {
      return AppTheme.fromValue(int.tryParse(val) ?? 0);
    }
    return AppTheme.system;
  }
}

