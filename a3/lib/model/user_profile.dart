import './skill.dart';
import './domain.dart';

class UserProfile {
  final String userProfileID;
  final Domain userDomian;
  final List<Skill> domainSpecificSkills;
  final List<Skill> nonDomainSpecificSkills;

  UserProfile({
    required this.userProfileID,
    required this.userDomian,
    required this.domainSpecificSkills,
    required this.nonDomainSpecificSkills,
  });
}
