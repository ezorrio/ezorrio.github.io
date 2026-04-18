enum AppTheme {
  light,
  dark,
  system;

  factory AppTheme.fromValue(int? index) {
    return switch (index) {
      0 => AppTheme.light,
      1 => AppTheme.dark,
      _ => AppTheme.system,
    };
  }
}
