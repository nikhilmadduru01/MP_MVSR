import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../model/skill_enum.dart';

import '../provider/skill_provider.dart';

// import '../screen/skills_screen.dart';

class AddSkillForm extends StatefulWidget {
  const AddSkillForm({super.key});

  @override
  State<AddSkillForm> createState() => _AddSkillFormState();
}

class _AddSkillFormState extends State<AddSkillForm> {
  final _addSkillkey = GlobalKey<FormState>();
  final Map<String, dynamic> skillMap = {
    'skillName': '',
    'skillID': '',
    'skillLevel': SkillEnum.initial,
  };

  void saveAndAddSkill(
    BuildContext context,
    SkillProvider skillData,
    double thickness,
  ) async {
    bool valid = _addSkillkey.currentState!.validate();

    if (!valid) {
      return;
    } else {
      _addSkillkey.currentState!.save();

      bool result = await _getConfirmation(
        context,
        thickness,
      );

      if (result) {
        skillData.addSkill(
          skillMap['skillID'],
          skillMap['skillName'],
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

  Future<bool> _getConfirmation(BuildContext context, double thickness) async {
    final mediaSize = MediaQuery.of(context).size;
    final bool result = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Check and Confirm'),
        content: Container(
          color: Colors.white,
          height: mediaSize.height * 0.3,
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Divider(
                color: Colors.blue,
                thickness: thickness,
              ),
              ListTile(
                title: Text(
                  skillMap['skillName'],
                ),
                subtitle: const Text('Skill'),
                leading: CircleAvatar(
                  child: Text(
                    skillMap['skillID'],
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

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;

    return Form(
      key: _addSkillkey,
      child: Container(
        color: Colors.white,
        height: mediaSize.height * 0.30,
        width: double.maxFinite,
        child: Consumer<SkillProvider>(
          builder: (context, skillData, _) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Add Skill Form',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
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
                  key: const ValueKey('skillName'),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Skill Name'),
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
                        skillMap['skillName'] = value!.trim();
                        skillMap['skillID'] =
                            (skillData.skillList.length + 1).toString();
                        skillMap['skilllevel'] = SkillEnum.initial;
                      },
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  saveAndAddSkill(
                    context,
                    skillData,
                    mediaSize.height * 0.005,
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(
                    mediaSize.height * 0.005,
                  ),
                  child: const Text('Add'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
