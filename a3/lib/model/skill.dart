import './skill_enum.dart';

class Skill {
  final String skillID;
  final String skillName;
  SkillEnum skilllevel;

  Skill({
    required this.skillID,
    required this.skillName,
    required this.skilllevel,
  });
}
