// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../models/club_model.dart';

class PlacingCard extends StatelessWidget {
  final ClubModel club;
  const PlacingCard(this.club, {super.key});

  @override
  Widget build(BuildContext context) {
    final status = club.status!;
    return ExpansionTile(
      backgroundColor: Colors.white,
      collapsedBackgroundColor: Colors.white,
      leading: Text('${club.status?.place}'),
      title: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              club.icon!,
            ),
            radius: 16,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(club.name ?? ' - '),
        ],
      ),
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            StatusPoint(title: 'PTS', score: status.pts!),
            StatusPoint(title: 'PJ', score: status.pj!),
            StatusPoint(title: 'VIT', score: status.vit!),
            StatusPoint(title: 'E', score: status.e!),
            StatusPoint(title: 'DER', score: status.der!),
            StatusPoint(title: 'GM', score: status.gm!),
            StatusPoint(title: 'GC', score: status.gc!),
            StatusPoint(title: 'SG', score: status.sg!),
          ],
        ),
        const Row(
          children: [
            Expanded(
                child: Divider(
              indent: 8,
              endIndent: 8,
            )),
            Text('Ultimas 5'),
            Expanded(
              child: Divider(
                indent: 8,
                endIndent: 8,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            children: status.lasts!
                .map((e) => e == true
                    ? const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      )
                    : const Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ))
                .toList(),
          ),
        )
      ],
    );
  }
}

class StatusPoint extends StatelessWidget {
  final String title;
  final int score;
  const StatusPoint({
    Key? key,
    required this.title,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      margin: const EdgeInsets.only(right: 4, bottom: 4),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(title),
          Text(
            score.toString(),
          ),
        ],
      ),
    );
  }
}
