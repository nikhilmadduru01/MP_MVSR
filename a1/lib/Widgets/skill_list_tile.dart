import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../Provider/user_profile_provider.dart';

import '../Model/skill.dart';
import '../Model/skill_enum.dart';

class SkillListTile extends StatefulWidget {
  final bool isDomain;
  final Skill skillTile;

  const SkillListTile({
    Key? key,
    required this.skillTile,
    required this.isDomain,
  }) : super(key: key);

  @override
  State<SkillListTile> createState() => _SkillListTileState();
}

class _SkillListTileState extends State<SkillListTile> {
  bool dropDown = false;
  bool selected = false;

  bool beginner = false;
  bool intermediate = false;
  bool advanced = false;

  @override
  Widget build(BuildContext context) {
    final userProfileData = Provider.of<UserProfileProvider>(context);
    return Card(
      child: ListTile(
        title: Text(widget.skillTile.skillName),
        subtitle: (!dropDown)
            ? (selected)
                ? (beginner)
                    ? const Text('Beginner')
                    : (intermediate)
                        ? const Text('Intermediate')
                        : const Text('Advanced')
                : const Text('Tap on the Tile')
            : Row(
                children: [
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(
                        (beginner) ? Colors.blue : Colors.black,
                      ),
                      textStyle: MaterialStateProperty.all(
                        TextStyle(
                          fontWeight:
                              (beginner) ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        beginner = true;
                        intermediate = false;
                        advanced = false;
                        selected = true;
                        dropDown = false;
                      });
                      userProfileData.addToTempList(
                        Skill(
                          skillID: widget.skillTile.skillID,
                          skillName: widget.skillTile.skillName,
                          skilllevel: SkillEnum.beginner,
                        ),
                      );
                    },
                    child: const Text(
                      'Beginner',
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(
                        (intermediate) ? Colors.blue : Colors.black,
                      ),
                      textStyle: MaterialStateProperty.all(
                        TextStyle(
                          fontWeight: (intermediate)
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        beginner = false;
                        intermediate = true;
                        advanced = false;
                        selected = true;
                        dropDown = false;
                      });
                      userProfileData.addToTempList(
                        Skill(
                          skillID: widget.skillTile.skillID,
                          skillName: widget.skillTile.skillName,
                          skilllevel: SkillEnum.intermediate,
                        ),
                      );
                    },
                    child: const Text('Intermediate'),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(
                        (advanced) ? Colors.blue : Colors.black,
                      ),
                      textStyle: MaterialStateProperty.all(
                        TextStyle(
                          fontWeight:
                              (advanced) ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        beginner = false;
                        intermediate = false;
                        advanced = true;
                        selected = true;
                        dropDown = false;
                      });
                      userProfileData.addToTempList(
                        Skill(
                          skillID: widget.skillTile.skillID,
                          skillName: widget.skillTile.skillName,
                          skilllevel: SkillEnum.advanced,
                        ),
                      );
                    },
                    child: const Text('Advanced'),
                  ),
                ],
              ),
        leading: CircleAvatar(
          child: Text(
            widget.skillTile.skillID,
          ),
        ),
        trailing: (selected)
            ? const Icon(
                Icons.check_box_outlined,
                color: Colors.blue,
              )
            : null,
        onTap: () {
          setState(
            () {
              if (!selected) {
                dropDown = !dropDown;
              } else {
                userProfileData.deleteFromTempList(widget.skillTile);
                dropDown = false;
                beginner = false;
                intermediate = false;
                advanced = false;
                selected = false;
              }
            },
          );
        },
      ),
    );
  }
}
