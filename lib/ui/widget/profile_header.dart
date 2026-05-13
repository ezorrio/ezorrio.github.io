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
      // Theme toggle
      button(
        classes: 'theme-toggle',
        onClick: toggleTheme,
        const [i(classes: 'fas fa-adjust', [])],
      ),

      // Avatar
      img(
        classes: 'profile-avatar',
        src: data.photo,
        attributes: const {'alt': 'Profile photo', 'loading': 'lazy'},
      ),

      // Name
      h1(classes: 'profile-name', [Component.text(data.name)]),

      // Title
      p(classes: 'profile-title', [Component.text(data.jobTitle)]),

      // Location
      p(classes: 'profile-location', [
        const i(classes: 'fas fa-map-marker-alt', []),
        Component.text(data.location),
      ]),

      // Bio
      p(classes: 'profile-bio', [Component.text(data.bio)]),

      // Social links
      SocialNetworks(links: data.networkLinks),

      // Skills
      if (data.skills.isNotEmpty)
        div(classes: 'profile-section', [
          p(classes: 'profile-section-title', [const Component.text('Skills')]),
          div(classes: 'skills-list', [
            for (final skill in data.skills)
              span(classes: 'skill-tag', [Component.text(skill)]),
          ]),
        ]),

      // Languages
      if (data.languages.isNotEmpty)
        div(classes: 'profile-section', [
          p(classes: 'profile-section-title', [const Component.text('Languages')]),
          div(classes: 'languages-list', [
            for (final lang in data.languages)
              span(classes: 'language-item', [
                span(classes: 'language-name', [Component.text(lang.language)]),
                span(classes: 'language-sep', [const Component.text('·')]),
                Component.text(lang.level),
              ]),
          ]),
        ]),
    ]);
  }
}
