import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../model/skill.dart';

import '../provider/job_profile_provider.dart';

import './job_profile_skill_tile.dart';

import '../screen/non_domain_skills_screen.dart';
import '../screen/domain_skills_screen.dart';

class JobProfileSkills extends StatelessWidget {
  const JobProfileSkills({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    final profileData = Provider.of<JobProfileProvider>(context);
    final List<Skill> listOfSkills = profileData.jobSkills;
    final List<Skill> listOfOtherSkills =
        profileData.jobProfile.otherSkillsRequired;
    return Container(
      color: Colors.white,
      height: mediaSize.height,
      width: mediaSize.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(
              mediaSize.height * 0.005,
            ),
            child: SizedBox(
              height: mediaSize.height * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Domain Skills',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        DomainSkillScreen.routename,
                      );
                    },
                    icon: const Icon(
                      Icons.add_box_outlined,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            thickness: mediaSize.height * 0.005,
            color: Colors.green,
          ),
          SizedBox(
            height: mediaSize.height * 0.40,
            child: ListView.builder(
              itemCount: listOfSkills.length,
              itemBuilder: (ctx, index) => JobProfileSkillTile(
                isDomainSkill: true,
                skillSelected: listOfSkills[index],
              ),
            ),
          ),
          Divider(
            thickness: mediaSize.height * 0.005,
            color: Colors.green,
          ),
          Padding(
            padding: EdgeInsets.all(
              mediaSize.height * 0.005,
            ),
            child: SizedBox(
              height: mediaSize.height * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Other Skills',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        NonDomainSkillScreen.routename,
                      );
                    },
                    icon: const Icon(
                      Icons.add_box_outlined,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            thickness: mediaSize.height * 0.005,
            color: Colors.green,
          ),
          SizedBox(
            height: mediaSize.height * 0.30,
            child: (listOfOtherSkills.isNotEmpty)
                ? ListView.builder(
                    itemCount: listOfOtherSkills.length,
                    itemBuilder: (ctx, index) => JobProfileSkillTile(
                      isDomainSkill: false,
                      skillSelected: listOfOtherSkills[index],
                    ),
                  )
                : Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          NonDomainSkillScreen.routename,
                        );
                      },
                      child: const Text('No Skills Added! Click here to Add'),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
