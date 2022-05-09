import 'package:flutter/material.dart';

import '../model/domain.dart';
import '../model/skill.dart';

class DomainProvider with ChangeNotifier {
  final List<Domain> _listOfDomains = [
    Domain(
      domainID: '1',
      domainName: 'Programming',
      parentGroup: 'Programming',
      skillList: [
        '2',
        '3',
        '4',
        '5',
        '6',
        '8',
      ],
    ),
    Domain(
      domainID: '2',
      domainName: 'Cloud Computing',
      parentGroup: 'Cloud Computing',
      skillList: [
        '11',
        '12',
        '13',
      ],
    ),
    Domain(
      domainID: '3',
      domainName: 'Data Analysis',
      parentGroup: 'Data Analysis',
      skillList: [
        '1',
        '2',
        '7',
      ],
    ),
    Domain(
      domainID: '4',
      domainName: 'DevOps',
      parentGroup: 'DevOps',
      skillList: [
        '9',
        '10',
        '2',
        '5',
      ],
    ),
    Domain(
      domainID: '5',
      domainName: 'Machine Learning',
      parentGroup: 'Machine Learning',
      skillList: [
        '14',
        '15',
      ],
    ),
  ];

  final List<Skill> _tempSkillForDomain = [];

  late bool _tempListConfirmed = false;

  Domain _selectDomain = Domain(
    domainID: 'id',
    domainName: 'name',
    parentGroup: 'parent',
    skillList: [],
  );

  List<Domain> get domainList {
    return [..._listOfDomains];
  }

  List<Skill> get tempSkills {
    return [..._tempSkillForDomain];
  }

  bool get tempListStatus {
    return _tempListConfirmed;
  }

  Domain get selectedDomain {
    return _selectDomain;
  }

  List<String> skillsToString() {
    List<String> tempSkillsToString = [];

    for (var element in _tempSkillForDomain) {
      tempSkillsToString.add(element.skillID);
    }

    return tempSkillsToString;
  }

  void selectDomain(Domain domain) {
    _selectDomain = Domain(
      domainID: domain.domainID,
      domainName: domain.domainName,
      parentGroup: domain.parentGroup,
      skillList: domain.skillList,
    );
    notifyListeners();
  }

  void confirmTempSkillList() {
    _tempListConfirmed = true;
    notifyListeners();
  }

  void addSkillToTempList(Skill skill) {
    _tempSkillForDomain.add(skill);
    notifyListeners();
  }

  void removeSkillFromTempList(Skill skill) {
    _tempSkillForDomain.removeWhere(
      (element) => element.skillID == skill.skillID,
    );
    notifyListeners();
  }

  void addDomain(
    String domainName,
    String domainID,
    String parentGroup,
    List<String> skillList,
  ) {
    Domain tempDomain = Domain(
      domainID: domainID,
      domainName: domainName,
      parentGroup: parentGroup,
      skillList: skillList,
    );

    _listOfDomains.add(tempDomain);
    _tempSkillForDomain.clear();
    _tempListConfirmed = false;

    notifyListeners();
  }

  void addSkillsToDomain() {
    List<String> tempSkills = skillsToString();

    _selectDomain.skillList.addAll(tempSkills);

    _tempSkillForDomain.clear();
    _tempListConfirmed = false;

    notifyListeners();
  }
}
