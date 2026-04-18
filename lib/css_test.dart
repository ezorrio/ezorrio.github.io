import 'package:jaspr/dom.dart';

@css
final List<StyleRule> appStyles = [
  const StyleRule.import('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap'),
  css.media(const MediaQuery.screen(maxWidth: Unit.pixels(600)), [
    css('.main-layout').styles(raw: {'padding': '10px'}),
  ]),
];
