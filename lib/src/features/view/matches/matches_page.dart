import 'package:flutter/material.dart';

import '../../common_widgets/custom_appbar.dart';

class MatchesPage extends StatelessWidget {
  const MatchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        titleText: 'Partidas',
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
