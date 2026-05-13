import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

class ScreenshotCarousel extends StatelessComponent {
  final List<String> screenshots;

  const ScreenshotCarousel({required this.screenshots, super.key});

  @override
  Component build(BuildContext context) {
    if (screenshots.isEmpty) return div([]);

    final isSingle = screenshots.length == 1;

    return div(classes: 'screenshots${isSingle ? ' screenshots--single' : ''}', [
      for (final src in screenshots)
        img(
          classes: 'screenshot-image',
          src: src,
          attributes: const {'loading': 'lazy'},
        ),
    ]);
  }
}

