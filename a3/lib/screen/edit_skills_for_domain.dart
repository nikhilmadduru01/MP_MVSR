import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../model/skill.dart';

import '../provider/domain_provider.dart';
import '../provider/skill_provider.dart';

import '../screen/domain_screen.dart';

import '../widgets/skill_tile.dart';

class EditSkillsForDomainScreen extends StatefulWidget {
  static const routename = './Edit Skills';
  const EditSkillsForDomainScreen({super.key});

  @override
  State<EditSkillsForDomainScreen> createState() =>
      _EditSkillsForDomainScreenState();
}

class _EditSkillsForDomainScreenState extends State<EditSkillsForDomainScreen> {
  Future _confirmSkills(
    BuildContext context,
  ) {
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
                    domainData.addSkillsToDomain();
                    Navigator.of(context).popUntil(
                      ModalRoute.withName(
                        DomianScreen.routename,
                      ),
                    );
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
        title: const Text('Edit Skills'),
      ),
      body: Container(
        color: Colors.white,
        height: mediaSize.height,
        width: mediaSize.width,
        child: Consumer<SkillProvider>(
          builder: (context, skillData, _) {
            final domainData = Provider.of<DomainProvider>(context);
            List<Skill> skillList = skillData.getNonOtherSkills(
              domainData.selectedDomain.skillList,
            );

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
          _confirmSkills(
            context,
          );
        },
        child: const Icon(
          Icons.check_circle_outline_outlined,
        ),
      ),
    );
  }
}
