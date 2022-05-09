import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../model/skill.dart';

import '../provider/domain_provider.dart';

import '../screen/add_skills_for_domian_screen.dart';

import '../widgets/skill_tile.dart';

class AddDomainForm extends StatefulWidget {
  const AddDomainForm({super.key});

  @override
  State<AddDomainForm> createState() => _AddDomainFormState();
}

class _AddDomainFormState extends State<AddDomainForm> {
  final _addDomainkey = GlobalKey<FormState>();

  final Map<String, dynamic> domainMap = {
    'domainName': '',
    'domainID': '',
    'parentGroup': '',
    'skillList': [],
  };

  void saveAndAddDomain(
    BuildContext context,
    DomainProvider domainData,
    double thickness,
  ) async {
    bool valid = _addDomainkey.currentState!.validate();

    if (!valid) {
      return;
    } else {
      setState(() {
        domainMap['domainID'] = (domainData.domainList.length + 1).toString();
        domainMap['skillList'] = domainData.skillsToString();
      });
      _addDomainkey.currentState!.save();
      bool result = await _getConfirmation(
        context,
        thickness,
        domainData,
      );

      if (result) {
        domainData.addDomain(
          domainMap['domainName'],
          domainMap['domainID'],
          domainMap['parentGroup'],
          domainMap['skillList'],
        );
        Future.delayed(
          Duration.zero,
        ).then(
          (_) {
            Navigator.of(context).pop();
          },
        );
      }
    }
  }

  Future<bool> _getConfirmation(
      BuildContext context, double thickness, DomainProvider domainData) async {
    final mediaSize = MediaQuery.of(context).size;
    final bool result = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Check and Confirm'),
        content: Container(
          color: Colors.white,
          height: mediaSize.height * 0.45,
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Divider(
                color: Colors.blue,
                thickness: thickness,
              ),
              ListTile(
                title: Text(
                  domainMap['domainName'],
                ),
                subtitle: Text(domainMap['parentGroup']),
                leading: CircleAvatar(
                  child: Text(
                    domainMap['domainID'],
                  ),
                ),
              ),
              Divider(
                color: Colors.blue,
                thickness: thickness,
              ),
              SizedBox(
                height: mediaSize.height * 0.25,
                child: ListView.builder(
                  itemCount: domainData.tempSkills.length,
                  itemBuilder: (context, index) => SkillTileWidget(
                    skill: domainData.tempSkills[index],
                    selectSkill: false,
                  ),
                ),
              ),
              Divider(
                color: Colors.blue,
                thickness: thickness,
              ),
              const Text(
                'Please check and Confirm your Query',
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('Confirm'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('Go Back'),
          ),
        ],
      ),
    );
    return result;
  }

  Future _showSKillList(BuildContext context, List<Skill> skillList) {
    return showDialog(
      context: context,
      builder: (context) {
        final mediaSize = MediaQuery.of(context).size;
        return AlertDialog(
          title: const Text("Skills List Added!"),
          content: SizedBox(
            height: mediaSize.height * 0.4,
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Divider(
                  color: Colors.blue,
                  thickness: mediaSize.height * 0.005,
                ),
                SizedBox(
                  height: mediaSize.height * 0.35,
                  width: double.maxFinite,
                  child: ListView.builder(
                    itemCount: skillList.length,
                    itemBuilder: (context, index) => SkillTileWidget(
                      selectSkill: false,
                      skill: skillList[index],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.blue,
                  thickness: mediaSize.height * 0.005,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Go Back'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _addDomainkey,
        child: Container(
          color: Colors.white,
          height: mediaSize.height * 0.9,
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                child: Text('Domain Add Form'),
              ),
              SizedBox(
                height: mediaSize.height * 0.006,
                child: Divider(
                  color: Colors.blue,
                  thickness: mediaSize.height * 0.006,
                ),
              ),
              SizedBox(
                width: mediaSize.width * 0.6,
                child: TextFormField(
                  key: const ValueKey('Domain Name'),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Domain Name'),
                  ),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter A Name!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(
                      () {
                        domainMap['domainName'] = value;
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                width: mediaSize.width * 0.6,
                child: TextFormField(
                  key: const ValueKey('Parent Name'),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Parent Name'),
                  ),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter A Name!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(
                      () {
                        domainMap['parentGroup'] = value;
                      },
                    );
                  },
                ),
              ),
              Consumer<DomainProvider>(
                builder: (context, domainData, _) {
                  if (domainData.tempListStatus) {
                    return TextButton(
                      onPressed: () {
                        _showSKillList(
                          context,
                          domainData.tempSkills,
                        );
                      },
                      child: Text(
                          '${domainData.tempSkills.length} skills added! Tap to view!'),
                    );
                  } else {
                    return TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          AddSkillsScreen.routename,
                        );
                      },
                      child: const Text('Add Skills'),
                    );
                  }
                },
              ),
              Consumer<DomainProvider>(
                builder: (context, domainData, _) {
                  return ElevatedButton(
                    onPressed: () {
                      if (domainData.tempSkills.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Please Add Some Skills before Proceding Further'),
                            duration: Duration(seconds: 3),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        saveAndAddDomain(
                          context,
                          domainData,
                          mediaSize.height * 0.005,
                        );
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(
                        mediaSize.height * 0.005,
                      ),
                      child: const Text('Add'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
