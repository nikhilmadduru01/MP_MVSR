import './skill.dart';
import './domain.dart';

class JobProfile {
  final String jobProfileID;
  final Domain jobDomian;
  final List<Skill> domainSkillsRequired;
  final List<Skill> otherSkillsRequired;

  JobProfile({
    required this.jobProfileID,
    required this.jobDomian,
    required this.domainSkillsRequired,
    required this.otherSkillsRequired,
  });
}
