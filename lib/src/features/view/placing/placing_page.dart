import 'package:flutter/material.dart';

import '../../../core/constants/app_data.dart';
import '../../common_widgets/custom_appbar.dart';
import '../../models/club_model.dart';
import 'components/placing_card.dart';

class PlacingPage extends StatelessWidget {
  const PlacingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ClubModel> clubs =
        AppData.clubs.map((e) => ClubModel.fromMap(e)).toList();
    clubs.sort((a, b) => a.status!.place!.compareTo(b.status!.place!));
    return Scaffold(
      appBar: CustomAppbar(
        titleText: 'Classificação',
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Clubes',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) => PlacingCard(clubs[index]),
            ),
          ),
        ],
      ),
    );
  }
}
