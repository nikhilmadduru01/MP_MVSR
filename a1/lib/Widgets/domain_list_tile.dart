import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/user_profile_provider.dart';

import '../Model/domain.dart';

import '../Screen/skills_screen.dart';

class DomainListTile extends StatelessWidget {
  final Domain tileDomain;

  const DomainListTile({
    Key? key,
    required this.tileDomain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProfileData = Provider.of<UserProfileProvider>(context);
    return Card(
      child: ListTile(
        title: Text(tileDomain.domainName),
        subtitle: Text(tileDomain.parentGroup),
        leading: CircleAvatar(
          child: Text(
            tileDomain.domainID,
          ),
        ),
        onTap: () {
          userProfileData.setTempDomain(tileDomain);
          Navigator.of(context).pushNamed(
            SkillScreen.routename,
          );
        },
      ),
    );
  }
}
