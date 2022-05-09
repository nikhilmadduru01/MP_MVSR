import 'package:flutter/foundation.dart';

import '../Model/skill_enum.dart';

import '../Model/skill.dart';

class SkillProvider with ChangeNotifier {
  final List<Skill> _skillList = [
    Skill(
      skillID: '1',
      skillName: 'SQL',
      skilllevel: SkillEnum.initial,
    ),
    Skill(
      skillID: '2',
      skillName: 'Python',
      skilllevel: SkillEnum.initial,
    ),
    Skill(
      skillID: '3',
      skillName: 'Cpp',
      skilllevel: SkillEnum.initial,
    ),
    Skill(
      skillID: '4',
      skillName: 'JavaScript',
      skilllevel: SkillEnum.initial,
    ),
    Skill(
      skillID: '5',
      skillName: 'Ruby',
      skilllevel: SkillEnum.initial,
    ),
    Skill(
      skillID: '6',
      skillName: 'PowerShell',
      skilllevel: SkillEnum.initial,
    ),
    Skill(
      skillID: '7',
      skillName: 'Statistics',
      skilllevel: SkillEnum.initial,
    ),
    Skill(
      skillID: '8',
      skillName: 'Java',
      skilllevel: SkillEnum.initial,
    ),
    Skill(
      skillID: '9',
      skillName: 'Docker',
      skilllevel: SkillEnum.initial,
    ),
    Skill(
      skillID: '10',
      skillName: 'Kubernetes',
      skilllevel: SkillEnum.initial,
    ),
    Skill(
      skillID: '11',
      skillName: 'AWS',
      skilllevel: SkillEnum.initial,
    ),
    Skill(
      skillID: '12',
      skillName: 'GCP',
      skilllevel: SkillEnum.initial,
    ),
    Skill(
      skillID: '13',
      skillName: 'Microsoft Azure',
      skilllevel: SkillEnum.initial,
    ),
    Skill(
      skillID: '14',
      skillName: 'Clustering',
      skilllevel: SkillEnum.initial,
    ),
    Skill(
      skillID: '15',
      skillName: 'Deep Learning',
      skilllevel: SkillEnum.initial,
    ),
  ];

  List<Skill> get listOfSkills {
    return [..._skillList];
  }

  Skill getSkill(String skillID) {
    return _skillList.firstWhere((element) => element.skillID == skillID);
  }

  List<Skill> getSkillsList(List<String> skillList) {
    List<Skill> loopedSkillList = [];

    for (var element in skillList) {
      loopedSkillList.add(getSkill(element));
    }

    return loopedSkillList;
  }

  List<Skill> otherSkills(List<Skill> skillList) {
    List<Skill> tempList = [..._skillList];
    List<Skill> knownSkills = skillList;

    List<Skill> finalList = [];

    for (var element in knownSkills) {
      tempList.removeWhere(
        (tempelement) => tempelement.skillID == element.skillID,
      );
    }

    finalList = tempList;

    return finalList;
  }
}
