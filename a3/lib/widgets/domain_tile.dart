import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/skill_provider.dart';
import '../provider/domain_provider.dart';

import '../model/domain.dart';
import '../model/skill.dart';

import './skill_tile.dart';

import '../screen/edit_skills_for_domain.dart';

class DomainTile extends StatefulWidget {
  final Domain selDomain;
  const DomainTile({
    super.key,
    required this.selDomain,
  });

  @override
  State<DomainTile> createState() => _DomainTileState();
}

class _DomainTileState extends State<DomainTile> {
  Future _showSKillList(BuildContext context, Domain selDomain) {
    final domianData = Provider.of<DomainProvider>(context, listen: false);
    domianData.selectDomain(selDomain);
    return showDialog(
      context: context,
      builder: (context) {
        final mediaSize = MediaQuery.of(context).size;

        return AlertDialog(
          title: Text("${selDomain.domainName}'s Skills List"),
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
                  child: Consumer<SkillProvider>(
                    builder: (context, skillData, _) {
                      List<Skill> skillList = skillData.getSkillsFromString(
                        selDomain.skillList,
                      );

                      if (skillList.isNotEmpty) {
                        return ListView.builder(
                          itemCount: skillList.length,
                          itemBuilder: (context, index) => SkillTileWidget(
                            selectSkill: false,
                            skill: skillList[index],
                          ),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
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
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EditSkillsForDomainScreen.routename);
              },
              child: const Text('Edit Skills'),
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
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(
            widget.selDomain.domainID,
          ),
        ),
        title: Text(
          widget.selDomain.domainName,
        ),
        subtitle: Text(
          widget.selDomain.parentGroup,
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.arrow_circle_down,
            color: Colors.blue,
          ),
          onPressed: () {
            _showSKillList(
              context,
              widget.selDomain,
            );
          },
        ),
        onTap: () {
          _showSKillList(
            context,
            widget.selDomain,
          );
        },
      ),
    );
  }
}
