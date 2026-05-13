import 'package:ezorrio_dev/model/education.dart';
import 'package:ezorrio_dev/model/project.dart';
import 'package:ezorrio_dev/model/work.dart';
import 'package:yaml/yaml.dart';

class DataRepository {
  final String name;
  final String photo;
  final String nickname;
  final String location;
  final String bio;
  final String studyPlace;
  final String studyField;
  final String jobPlace;
  final String jobTitle;
  final SocialNetworkLinks networkLinks;

  final List<Education> education;
  final List<Project> projects;
  final List<Work> works;

  DataRepository._({
    required this.name,
    required this.photo,
    required this.nickname,
    required this.location,
    required this.bio,
    required this.studyPlace,
    required this.studyField,
    required this.jobPlace,
    required this.jobTitle,
    required this.networkLinks,
    required this.education,
    required this.projects,
    required this.works,
  });

  static Future<DataRepository> load({
    required Future<String> Function(String path) readText,
  }) async {
    final profile = loadYaml(await readText('content/profile.yaml'));
    final social = profile['networkLinks'];

    return DataRepository._(
      name: profile['name'] as String,
      photo: profile['photo'] as String,
      nickname: profile['nickname'] as String,
      location: profile['location'] as String,
      bio: profile['bio'] as String,
      studyPlace: profile['studyPlace'] as String,
      studyField: profile['studyField'] as String,
      jobPlace: profile['jobPlace'] as String,
      jobTitle: profile['jobTitle'] as String,
      networkLinks: SocialNetworkLinks(
        email: social['email'] as String,
        linkedin: social['linkedin'] as String,
        telegram: social['telegram'] as String,
        github: social['github'] as String,
        instagram: social['instagram'] as String,
        twitter: social['twitter'] as String,
      ),
      education: _parseEducationList(
        loadYaml(await readText('content/education.yaml')),
      ),
      projects: _parseProjectList(
        loadYaml(await readText('content/projects.yaml')),
      ),
      works: _parseWorkList(loadYaml(await readText('content/work.yaml'))),
    );
  }

  static List<Education> _parseEducationList(dynamic yaml) {
    final list = yaml as YamlList;
    return list.map((item) {
      return Education(
        place: item['place'] as String,
        occupation: item['occupation'] as String,
        description: item['description'] as String?,
        period: item['period'] as String?,
      );
    }).toList();
  }

  static List<Project> _parseProjectList(dynamic yaml) {
    final list = yaml as YamlList;
    return list.map(_parseProject).toList();
  }

  static List<Work> _parseWorkList(dynamic yaml) {
    final list = yaml as YamlList;
    return list.map((item) {
      final rawProjects = item['projects'] as YamlList;

      return Work(
        company: item['company'] as String,
        position: item['position'] as String,
        link: item['link'] as String?,
        period: item['period'] as String?,
        projects: rawProjects.map(_parseProject).toList(),
      );
    }).toList();
  }

  static Project _parseProject(dynamic item) {
    final tags = item['tags'] as YamlList?;
    return Project(
      title: item['title'] as String,
      description: (item['description'] as String).trim(),
      link: item['link'] as String?,
      tags: tags?.map((e) => e.toString()).toList() ?? [],
      period: item['period'] as String?,
    );
  }
}

class SocialNetworkLinks {
  final String email;
  final String linkedin;
  final String telegram;
  final String github;
  final String instagram;
  final String twitter;

  const SocialNetworkLinks({
    required this.email,
    required this.linkedin,
    required this.telegram,
    required this.github,
    required this.instagram,
    required this.twitter,
  });
}
