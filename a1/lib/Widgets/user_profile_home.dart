import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../Provider/user_profile_provider.dart';

import '../Model/user_profile.dart';

class UserProfileHome extends StatelessWidget {
  const UserProfileHome({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    final userProfileData = Provider.of<UserProfileProvider>(context);
    final UserProfile myProfile = userProfileData.userProfile;
    return Container(
      color: Colors.white,
      height: mediaSize.height,
      width: mediaSize.width,
      child: Column(
        children: [
          Card(
            child: ListTile(
              title: Text(
                myProfile.userProfileID,
              ),
              subtitle: const Text('User Profile ID'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                myProfile.userDomian.domainID,
              ),
              subtitle: const Text('Domain ID'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                myProfile.userDomian.domainName,
              ),
              subtitle: const Text('Domain Name'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                myProfile.userDomian.parentGroup,
              ),
              subtitle: const Text('Parent Group'),
            ),
          ),
        ],
      ),
    );
  }
}
