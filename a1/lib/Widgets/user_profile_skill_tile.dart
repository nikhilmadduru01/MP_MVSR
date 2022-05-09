import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../Provider/user_profile_provider.dart';

import '../Model/skill.dart';
import '../Model/skill_enum.dart';

// import '../Screen/user_profile_screen.dart';

class UserProfileSkillTile extends StatelessWidget {
  final Skill skillSelected;
  final bool isDomainSkill;

  const UserProfileSkillTile({
    super.key,
    required this.skillSelected,
    required this.isDomainSkill,
  });

  Future<bool> _getDeletionConfirmation(
    BuildContext context,
    UserProfileProvider userData,
    bool isDomianSkill,
    Skill skillSelected,
  ) async {
    final result = await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Profile Check'),
        content: Builder(builder: (context) {
          final mediaSize = MediaQuery.of(context).size;
          return SizedBox(
            height: mediaSize.height * 0.30,
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: mediaSize.height * 0.05,
                ),
                Divider(
                  thickness: mediaSize.height * 0.005,
                  color: Colors.blue,
                ),
                ListTile(
                  title: Text(
                    skillSelected.skillName,
                  ),
                  subtitle: (isDomainSkill)
                      ? const Text('Domian Skill')
                      : const Text('Other Skill'),
                  leading: CircleAvatar(
                    child: Text(skillSelected.skillID),
                  ),
                ),
                Divider(
                  thickness: mediaSize.height * 0.005,
                  color: Colors.blue,
                ),
                SizedBox(
                  height: mediaSize.height * 0.05,
                ),
                const Text(
                  'Are You sure want to remove the above skill from your skill set?',
                ),
              ],
            ),
          );
        }),
        actions: [
          TextButton(
            onPressed: () {
              if (isDomianSkill) {
                userData.removeDomainSkill(skillSelected);
              } else {
                userData.removeOtherSkill(skillSelected);
              }
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

  void showSnickerBar(
    bool isDomain,
    BuildContext context,
    Skill skillDeleted,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: (isDomain)
            ? Text('${skillDeleted.skillName} is removed from Domain Skills!')
            : Text('${skillDeleted.skillName} is removed from Domain Skills!'),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final skilllevel = skillMap[skillSelected.skilllevel];
    final userData = Provider.of<UserProfileProvider>(context);
    return Card(
      child: ListTile(
        title: Text(
          skillSelected.skillName,
        ),
        subtitle: Text(
          skilllevel!,
        ),
        trailing: IconButton(
          onPressed: () async {
            bool result = await _getDeletionConfirmation(
              context,
              userData,
              isDomainSkill,
              skillSelected,
            );
            if (result) {
              Future.delayed(Duration.zero).then(
                (_) {
                  showSnickerBar(
                    isDomainSkill,
                    context,
                    skillSelected,
                  );
                },
              );
            }
          },
          icon: const Icon(
            Icons.delete_outline_outlined,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
