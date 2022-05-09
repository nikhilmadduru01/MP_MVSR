import 'package:flutter/material.dart';

import '../Model/skill.dart';
import '../Model/skill_enum.dart';

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
        child: Text(
          selectedSkill.skillID,
        ),
      ),
      title: Text(selectedSkill.skillName),
      subtitle: Text(skillLevel!),
    );
  }
}
