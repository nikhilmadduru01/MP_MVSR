import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../model/skill.dart';

import '../provider/skill_provider.dart';
import '../provider/domain_provider.dart';

import '../widgets/skill_tile.dart';

class AddSkillsScreen extends StatefulWidget {
  static const routename = '/AddSkills';
  const AddSkillsScreen({super.key});

  @override
  State<AddSkillsScreen> createState() => _AddSkillsScreenState();
}

class _AddSkillsScreenState extends State<AddSkillsScreen> {
  Future _confirmSkills(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        final mediaSize = MediaQuery.of(context).size;
        return AlertDialog(
          title: const Text('Confirm Skills'),
          content: SizedBox(
            height: mediaSize.height * 0.4,
            width: double.maxFinite,
            child: Column(
              children: [
                Divider(
                  color: Colors.blue,
                  thickness: mediaSize.height * 0.005,
                ),
                SizedBox(
                  height: mediaSize.height * 0.35,
                  width: double.maxFinite,
                  child: Consumer<DomainProvider>(
                    builder: (context, domainData, _) {
                      List<Skill> skillList = domainData.tempSkills;

                      if (skillList.isNotEmpty) {
                        return ListView.builder(
                          itemCount: skillList.length,
                          itemBuilder: (context, index) => SkillTileWidget(
                            selectSkill: false,
                            skill: skillList[index],
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
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
            Consumer<DomainProvider>(
              builder: (context, domainData, _) {
                return TextButton(
                  onPressed: () {
                    domainData.confirmTempSkillList();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Confirm'),
                );
              },
            ),
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
      appBar: AppBar(
        title: const Text('Add Skills'),
      ),
      body: Container(
        color: Colors.white,
        height: mediaSize.height,
        width: mediaSize.width,
        child: Consumer<SkillProvider>(
          builder: (context, skillData, _) {
            List<Skill> skillList = skillData.skillList;

            if (skillList.isNotEmpty) {
              return ListView.builder(
                itemCount: skillList.length,
                itemBuilder: (context, index) => SkillTileWidget(
                  selectSkill: true,
                  skill: skillList[index],
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _confirmSkills(context);
        },
        child: const Icon(
          Icons.check_circle_outline_outlined,
        ),
      ),
    );
  }
}
