import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:ezorrio_dev/resource/data_repository.dart';

class SocialNetworks extends StatelessComponent {
  final SocialNetworkLinks links;

  const SocialNetworks({required this.links, super.key});

  Component _socialBtn(String iconClass, String label, String url, String brand) {
    return a(
      href: url,
      attributes: {'target': '_blank', 'title': label, 'aria-label': label},
      classes: 'social-btn social-btn--$brand',
      [i(classes: iconClass, const [])],
    );
  }

  @override
  Component build(BuildContext context) {
    return div(classes: 'social-links', [
      if (links.email != null) _socialBtn('fas fa-envelope', 'Email', links.email!, 'email'),
      if (links.github != null) _socialBtn('fab fa-github', 'GitHub', links.github!, 'github'),
      if (links.linkedin != null) _socialBtn('fab fa-linkedin-in', 'LinkedIn', links.linkedin!, 'linkedin'),
      if (links.telegram != null) _socialBtn('fab fa-telegram-plane', 'Telegram', links.telegram!, 'telegram'),
    ]);
  }
}
