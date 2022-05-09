import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../model/skill.dart';

import '../provider/skill_provider.dart';

import '../widgets/add_skill_bottom_sheet.dart';
import '../widgets/skill_tile.dart';

class SkillsScreen extends StatefulWidget {
  static const routename = '/skills_screen';

  const SkillsScreen({super.key});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  Future _addSkillDialog(BuildContext context) {
    return showModalBottomSheet(
      elevation: 20,
      isDismissible: false,
      context: context,
      builder: (context) {
        return const AddSkillForm();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skills Screen'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.home),
          ),
        ],
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
                  selectSkill: false,
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
          _addSkillDialog(context);
        },
        child: const Icon(
          Icons.add_box_outlined,
        ),
      ),
    );
  }
}
