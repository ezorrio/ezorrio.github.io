import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:ezorrio_dev/resource/data_repository.dart';

class SocialNetworks extends StatelessComponent {
  final SocialNetworkLinks links;

  const SocialNetworks({required this.links, super.key});

  Component _socialBtn(String iconClass, String label, String url) {
    return a(
      href: url,
      attributes: const {'target': '_blank'},
      classes: 'social-btn',
      [
        i(classes: iconClass, const []),
        Component.text(label),
      ],
    );
  }

  @override
  Component build(BuildContext context) {
    return div(classes: 'social-links', [
      _socialBtn('fas fa-envelope', 'Email me', links.email),
      _socialBtn('fab fa-github', 'GitHub', links.github),
      _socialBtn('fab fa-linkedin', 'LinkedIn', links.linkedin),
    ]);
  }
}
