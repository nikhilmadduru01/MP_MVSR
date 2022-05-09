import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../model/domain.dart';

import '../provider/domain_provider.dart';

import '../widgets/domain_tile.dart';
import '../widgets/add_domain_bottom_sheet.dart.dart';

class DomianScreen extends StatefulWidget {
  static const routename = '/domain_Screen';
  const DomianScreen({super.key});

  @override
  State<DomianScreen> createState() => _DomianScreenState();
}

class _DomianScreenState extends State<DomianScreen> {
  Future _addDomainDialog(BuildContext context) {
    return showModalBottomSheet(
      enableDrag: false,
      context: context,
      builder: (context) {
        return const AddDomainForm();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Domains'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        height: mediaSize.height,
        width: mediaSize.width,
        child: Consumer<DomainProvider>(
          builder: (context, domainData, _) {
            final List<Domain> domainList = domainData.domainList;

            if (domainList.isNotEmpty) {
              return ListView.builder(
                itemCount: domainList.length,
                itemBuilder: (context, index) => DomainTile(
                  selDomain: domainList[index],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addDomainDialog(context);
        },
        child: const Icon(
          Icons.add_box_outlined,
        ),
      ),
    );
  }
}
