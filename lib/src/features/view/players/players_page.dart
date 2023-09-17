import 'package:flutter/material.dart';

import '../../../core/constants/app_data.dart';
import '../../common_widgets/custom_appbar.dart';

class PlayersPage extends StatelessWidget {
  const PlayersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        titleText: 'Jogadoras',
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: ListView.builder(
            itemCount: AppData.clubs.length,
            itemBuilder: (context, index) {
              final club = AppData.clubs[index];
              final List<Map<String, dynamic>> players =
                  club['players'] as List<Map<String, dynamic>>;
              return Card(
                elevation: 4,
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: ExpansionTile(
                      backgroundColor: Colors.transparent,
                      title: Text(club['name'] as String),
                      leading: Image.network(
                        club['icon'] as String,
                        width: 40,
                        height: 40,
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Wrap(
                            children: players.map((e) {
                              final List<String> words = e['name'].split(' ');
                              return Container(
                                height: 100,
                                width: 56,
                                margin:
                                    const EdgeInsets.only(right: 8, bottom: 8),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 32,
                                      backgroundImage: NetworkImage(
                                        e['image'],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 24,
                                      decoration: const BoxDecoration(
                                          color: Colors.white),
                                      child: Text(
                                        '${words.first} ${words.last}',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 11, height: 1),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        )
                      ]),
                ),
              );
            }),
      ),
    );
  }
}
