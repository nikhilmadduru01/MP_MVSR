import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../model/domain.dart';

import '../provider/domain_provider.dart';

import '../widget/domain_list_tile.dart';

class DomainScreen extends StatefulWidget {
  static const routename = '/domain_screen';
  const DomainScreen({super.key});

  @override
  State<DomainScreen> createState() => _DomainScreenState();
}

class _DomainScreenState extends State<DomainScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Domain'),
      ),
      body: Container(
        color: Colors.white,
        height: mediaSize.height,
        width: mediaSize.width,
        child: Consumer<DomainProvider>(
          builder: (context, domainData, _) {
            final List<Domain> domainList = domainData.listOfDomains;
            return ListView.builder(
              itemCount: domainList.length,
              itemBuilder: (context, index) => DomainListTile(
                tileDomain: domainList[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
