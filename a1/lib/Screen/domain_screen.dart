import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/domain.dart';

import '../Widgets/domain_list_tile.dart';

import '../Provider/domain_provider.dart';

class DomainScreen extends StatefulWidget {
  static const routename = './domain_screen';
  const DomainScreen({Key? key}) : super(key: key);

  @override
  State<DomainScreen> createState() => _DomainScreenState();
}

class _DomainScreenState extends State<DomainScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    final domainData = Provider.of<DomainProvider>(context);
    final List<Domain> listOfDomains = domainData.listOfDomains;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Domain'),
      ),
      body: Container(
        height: mediaSize.height,
        width: mediaSize.width,
        color: Colors.white,
        child: ListView.builder(
          itemCount: listOfDomains.length,
          itemBuilder: (ctx, index) => DomainListTile(
            tileDomain: listOfDomains[index],
          ),
        ),
      ),
    );
  }
}
