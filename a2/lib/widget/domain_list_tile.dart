import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/job_profile_provider.dart';

import '../model/domain.dart';

import '../screen/skills_screen.dart';

class DomainListTile extends StatelessWidget {
  final Domain tileDomain;

  const DomainListTile({
    Key? key,
    required this.tileDomain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jobProfileData = Provider.of<JobProfileProvider>(context);
    return Card(
      child: ListTile(
        title: Text(tileDomain.domainName),
        subtitle: Text(tileDomain.parentGroup),
        leading: CircleAvatar(
          backgroundColor: Colors.green,
          child: Text(
            tileDomain.domainID,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        onTap: () {
          jobProfileData.setTempDomain(tileDomain);
          Navigator.of(context).pushNamed(
            SkillScreen.routename,
          );
        },
      ),
    );
  }
}
