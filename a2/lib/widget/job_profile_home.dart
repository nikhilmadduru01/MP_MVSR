import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/job_profile_provider.dart';

import '../model/job_profile.dart';

class JobProfileHome extends StatelessWidget {
  const JobProfileHome({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    final jobProfileData = Provider.of<JobProfileProvider>(context);
    final JobProfile myProfile = jobProfileData.jobProfile;
    return Container(
      color: Colors.white,
      height: mediaSize.height,
      width: mediaSize.width,
      child: Column(
        children: [
          Card(
            child: ListTile(
              title: Text(
                myProfile.jobProfileID,
              ),
              subtitle: const Text('User Profile ID'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                myProfile.jobDomian.domainID,
              ),
              subtitle: const Text('Domain ID'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                myProfile.jobDomian.domainName,
              ),
              subtitle: const Text('Domain Name'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                myProfile.jobDomian.parentGroup,
              ),
              subtitle: const Text('Parent Group'),
            ),
          ),
        ],
      ),
    );
  }
}
