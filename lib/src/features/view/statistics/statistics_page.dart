import 'package:flutter/material.dart';

import '../../common_widgets/custom_appbar.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        titleText: 'Estatísticas',
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
