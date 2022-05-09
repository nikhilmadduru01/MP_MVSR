import 'package:flutter/material.dart';

import '../model/skill.dart';
import '../model/skill_enum.dart';

class ConfirmSkillTile extends StatelessWidget {
  final Skill selectedSkill;

  const ConfirmSkillTile({
    super.key,
    required this.selectedSkill,
  });

  @override
  Widget build(BuildContext context) {
    final skillLevel = skillMap[selectedSkill.skilllevel];
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.green,
        child: Text(
          selectedSkill.skillID,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      title: Text(selectedSkill.skillName),
      subtitle: Text(skillLevel!),
    );
  }
}
