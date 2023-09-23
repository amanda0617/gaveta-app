import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/app_data.dart';
import '../../common_widgets/custom_appbar.dart';
import '../../models/match_model.dart';

class MatchesPage extends StatelessWidget {
  const MatchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MatchModel> matches = AppData.matches
        .map(
          (e) => MatchModel.fromMap(e),
        )
        .toList();
    return Scaffold(
      appBar: CustomAppbar(
        titleText: 'Partidas',
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: matches.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 40,
                                width: 40,
                                child:
                                    Image.network(matches[index].home!.icon!),
                              ),
                              Expanded(
                                  child: Text(
                                matches[index].home?.name ?? '-',
                                overflow: TextOverflow.ellipsis,
                              )),
                              const SizedBox(
                                width: 16,
                              ),
                              Text(
                                matches[index].home?.score.toString() ?? '0',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Visibility(
                                visible: matches[index].home!.won == true,
                                replacement: const SizedBox(
                                  width: 24,
                                ),
                                child: const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: Image.network(
                                    matches[index].visitant!.icon!),
                              ),
                              Expanded(
                                  child: Text(
                                      matches[index].visitant?.name ?? '-',
                                      overflow: TextOverflow.ellipsis)),
                              const SizedBox(
                                width: 16,
                              ),
                              Text(
                                matches[index].visitant?.score.toString() ??
                                    '0',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Visibility(
                                visible: matches[index].visitant!.won == true,
                                replacement: const SizedBox(
                                  width: 24,
                                ),
                                child: const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Visibility(
                          visible: matches[index].finish == false,
                          replacement: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('FIM'),
                              Text(
                                DateFormat('dd/MM/yyyy').format(
                                  DateTime.parse(matches[index].date!),
                                ),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                DateFormat('dd/MM/yyyy').format(
                                  DateTime.parse(matches[index].date!),
                                ),
                              ),
                              Text(
                                '${DateFormat('hh:mm').format(
                                  DateTime.parse(matches[index].date!),
                                )}hrs',
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
