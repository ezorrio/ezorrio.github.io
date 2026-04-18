import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:ezorrio_dev/resource/data_repository.dart';
import 'package:ezorrio_dev/ui/widget/social_networks.dart';

class ProfileHeader extends StatelessComponent {
  final DataRepository data;
  final VoidCallback toggleTheme;

  const ProfileHeader({
    required this.data,
    required this.toggleTheme,
    super.key,
  });

  @override
  Component build(BuildContext context) {
    return div(classes: 'profile-header', [
      button(
        classes: 'theme-toggle',
        onClick: toggleTheme,
        const [i(classes: 'fas fa-moon', [])]
      ),
      div(classes: 'text-center', [
        h1(classes: 'mb-sm', [Component.text(data.name)]),
        // h3(classes: 'text-caption mb-sm', [Component.text(data.nickname)]),
        h3(classes: 'text-caption mb-md', [Component.text(data.jobTitle)]),
        SocialNetworks(links: data.networkLinks),
      ])
    ]);
  }
}
