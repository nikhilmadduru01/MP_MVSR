import './skill.dart';

class JobProfile {
  final String jobProfileID;
  final String domianName;
  final List<Skill> domainSkillsRequired;
  final int rankRange;

  JobProfile({
    required this.jobProfileID,
    required this.domianName,
    required this.domainSkillsRequired,
    required this.rankRange,
  });
}
