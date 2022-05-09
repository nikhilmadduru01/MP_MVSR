import 'package:flutter/material.dart';

import '../model/domain.dart';
import '../model/skill.dart';
import '../model/job_profile.dart';

class JobProfileProvider with ChangeNotifier {
  late JobProfile _myJobProfile;

  bool _jobCreated = false;

  bool get jobCreated {
    return _jobCreated;
  }

  void _createJob() {
    _jobCreated = true;
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

  JobProfile get jobProfile {
    return _myJobProfile;
  }

  List<Skill> get jobSkills {
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

    _myJobProfile = JobProfile(
      jobProfileID: '1',
      jobDomian: _domain,
      domainSkillsRequired: _skillsSelected,
      otherSkillsRequired: [],
    );

    // print(_myUserProfile);
    _createJob();
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
      _myJobProfile.otherSkillsRequired.add(skillAdded);
    }
    _tempSkillsSelected.clear();
    notifyListeners();
  }

  void addOtherDomainSkilsToProfile() {
    List<Skill> skillToAdd = [..._tempSkillsSelected];

    for (var skillAdded in skillToAdd) {
      _myJobProfile.domainSkillsRequired.add(skillAdded);
    }
    _tempSkillsSelected.clear();
    notifyListeners();
  }

  List<Skill> totalOtherSkills(List<Skill> domainSkills) {
    final List<Skill> finalList = [];

    for (var element in domainSkills) {
      finalList.add(element);
    }

    for (var element in _myJobProfile.otherSkillsRequired) {
      finalList.add(element);
    }
    return finalList;
  }

  void removeDomainSkill(Skill skill) {
    _myJobProfile.domainSkillsRequired.removeWhere(
      (element) => element.skillID == skill.skillID,
    );
    notifyListeners();
  }

  void removeOtherSkill(Skill skill) {
    _myJobProfile.otherSkillsRequired.removeWhere(
      (element) => element.skillID == skill.skillID,
    );
    notifyListeners();
  }
}
