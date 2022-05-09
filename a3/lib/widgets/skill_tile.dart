import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/domain_provider.dart';

import '../model/skill.dart';

class SkillTileWidget extends StatefulWidget {
  final bool selectSkill;
  final Skill skill;
  const SkillTileWidget({
    super.key,
    required this.skill,
    required this.selectSkill,
  });

  @override
  State<SkillTileWidget> createState() => _SkillTileWidgetState();
}

class _SkillTileWidgetState extends State<SkillTileWidget> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: mediaSize.width * 0.05,
        vertical: mediaSize.height * 0.01,
      ),
      child: Card(
        elevation: 15,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: mediaSize.height * 0.02,
          ),
          child: Consumer<DomainProvider>(
            builder: (context, domainData, _) => ListTile(
              title: Text(
                widget.skill.skillName,
              ),
              subtitle: (widget.selectSkill)
                  ? (!_selected)
                      ? const Text('Tap to Add')
                      : null
                  : null,
              leading: CircleAvatar(
                child: Text(
                  widget.skill.skillID,
                ),
              ),
              trailing: (widget.selectSkill)
                  ? (_selected)
                      ? const Icon(
                          Icons.check_circle_outline,
                          color: Colors.blue,
                        )
                      : null
                  : null,
              onTap: () {
                if (widget.selectSkill) {
                  if (_selected) {
                    setState(() {
                      _selected = false;
                      domainData.removeSkillFromTempList(widget.skill);
                    });
                  } else {
                    setState(() {
                      _selected = true;
                      domainData.addSkillToTempList(widget.skill);
                    });
                  }
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
