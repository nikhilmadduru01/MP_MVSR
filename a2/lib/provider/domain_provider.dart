import 'package:flutter/material.dart';

import '../model/domain.dart';

class DomainProvider with ChangeNotifier {
  final List<Domain> _domainList = [
    Domain(
      domainID: '1',
      domainName: 'Programming',
      parentGroup: 'Programming',
      skillList: [
        '2',
        '3',
        '4',
        '5',
        '6',
        '8',
      ],
    ),
    Domain(
      domainID: '2',
      domainName: 'Cloud Computing',
      parentGroup: 'Cloud Computing',
      skillList: [
        '11',
        '12',
        '13',
      ],
    ),
    Domain(
      domainID: '3',
      domainName: 'Data Analysis',
      parentGroup: 'Data Analysis',
      skillList: [
        '1',
        '2',
        '7',
      ],
    ),
    Domain(
      domainID: '4',
      domainName: 'DevOps',
      parentGroup: 'DevOps',
      skillList: [
        '9',
        '10',
        '2',
        '5',
      ],
    ),
    Domain(
      domainID: '5',
      domainName: 'Machine Learning',
      parentGroup: 'Machine Learning',
      skillList: [
        '14',
        '15',
      ],
    ),
  ];

  Domain getDomain(String domainID) {
    return _domainList.firstWhere((element) => element.domainID == domainID);
  }

  List<Domain> get listOfDomains {
    return [..._domainList];
  }
}
