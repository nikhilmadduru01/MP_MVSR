import 'package:flutter/material.dart';

import '../model/skill.dart';
import '../model/skill_enum.dart';

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

  List<Skill> get skillList {
    return [..._skillList];
  }

  List<Skill> getSkillsFromString(List<String> skillIDList) {
    final List<Skill> tempList = [];

    for (var element in skillIDList) {
      tempList.add(
        getSkillByID(
          element,
        ),
      );
    }
    return tempList;
  }

  void addSkill(String skillID, String skillName) {
    Skill temp = Skill(
      skillID: skillID,
      skillName: skillName,
      skilllevel: SkillEnum.initial,
    );

    _skillList.add(temp);
    notifyListeners();
  }

  void removeSkill(Skill skill) {
    _skillList.removeWhere(
      (element) => element.skillID == skill.skillID,
    );
    notifyListeners();
  }

  Skill getSkillByID(String skillID) {
    return _skillList.singleWhere(
      (element) => element.skillID == skillID,
    );
  }

  Skill getSkillByName(String skillName) {
    return _skillList.singleWhere(
      (element) => element.skillName == skillName,
    );
  }

  List<Skill> getNonOtherSkills(List<String> skillList) {
    List<Skill> currentSkills = [];

    for (var element in skillList) {
      currentSkills.add(
        getSkillByID(element),
      );
    }

    List<Skill> otherSkills = [..._skillList];

    for (var selement in currentSkills) {
      otherSkills.removeWhere((element) => element.skillID == selement.skillID);
    }

    return otherSkills;
  }
}
