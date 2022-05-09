import 'package:flutter/foundation.dart';

import '../Model/user_profile.dart';
import '../Model/skill.dart';
import '../Model/domain.dart';

class UserProfileProvider with ChangeNotifier {
  late UserProfile _myUserProfile;

  bool _userCreated = false;

  bool get userCreated {
    return _userCreated;
  }

  void _createUser() {
    _userCreated = true;
    notifyListeners();
  }

  late Domain _domain;
  late Domain _tempDomain;

  final List<Skill> _skillsSelected = [];

  final List<Skill> _tempSkillsSelected = [];

  void setTempDomain(Domain domain) {
    _tempDomain = domain;
    notifyListeners();
  }

  void addToTempList(Skill skillID) {
    _tempSkillsSelected.add(skillID);
    notifyListeners();
  }

  void deleteFromTempList(Skill skillID) {
    _tempSkillsSelected.removeWhere(
      (element) => element.skillID == skillID.skillID,
    );
    notifyListeners();
  }

  List<Skill> get tempSkills {
    return [..._tempSkillsSelected];
  }

  Domain get domain {
    return _domain;
  }

  Domain get tempDomain {
    return _tempDomain;
  }

  UserProfile get userProfile {
    return _myUserProfile;
  }

  List<Skill> get userSkills {
    return [..._skillsSelected];
  }

  void setDomain(Domain domain) {
    _domain = domain;
    notifyListeners();
  }

  void setSkillList(List<Skill> skillList) {
    for (var element in skillList) {
      _skillsSelected.add(element);
    }
    notifyListeners();
  }

  void confirmProfileDetails() {
    setDomain(_tempDomain);
    setSkillList(_tempSkillsSelected);

    // print(_domain);
    // print(_skillsSelected);

    _myUserProfile = UserProfile(
      userProfileID: '1',
      userDomian: _domain,
      domainSpecificSkills: _skillsSelected,
      nonDomainSpecificSkills: [],
    );

    // print(_myUserProfile);
    _createUser();
    _tempSkillsSelected.clear();

    notifyListeners();
  }

  List<Skill> totalOtherDomainSkills(List<Skill> domainSkills) {
    List<Skill> totalDomainskill = domainSkills;
    List<Skill> selectedSkills = [..._skillsSelected];
    List<Skill> finalList = [];

    for (var element in selectedSkills) {
      totalDomainskill.removeWhere(
        (tempelement) => tempelement.skillID == element.skillID,
      );
    }

    finalList = totalDomainskill;
    return finalList;
  }

  void addOtherSkillsToProfile() {
    List<Skill> skillToAdd = [..._tempSkillsSelected];

    for (var skillAdded in skillToAdd) {
      _myUserProfile.nonDomainSpecificSkills.add(skillAdded);
    }
    _tempSkillsSelected.clear();
    notifyListeners();
  }

  void addOtherDomainSkilsToProfile() {
    List<Skill> skillToAdd = [..._tempSkillsSelected];

    for (var skillAdded in skillToAdd) {
      _myUserProfile.domainSpecificSkills.add(skillAdded);
    }
    _tempSkillsSelected.clear();
    notifyListeners();
  }

  List<Skill> totalOtherSkills(List<Skill> domainSkills) {
    final List<Skill> finalList = [];

    for (var element in domainSkills) {
      finalList.add(element);
    }

    for (var element in _myUserProfile.nonDomainSpecificSkills) {
      finalList.add(element);
    }
    return finalList;
  }

  void removeDomainSkill(Skill skill) {
    _myUserProfile.domainSpecificSkills.removeWhere(
      (element) => element.skillID == skill.skillID,
    );
    notifyListeners();
  }

  void removeOtherSkill(Skill skill) {
    _myUserProfile.nonDomainSpecificSkills.removeWhere(
      (element) => element.skillID == skill.skillID,
    );
    notifyListeners();
  }
}
