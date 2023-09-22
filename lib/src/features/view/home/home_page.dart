import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../core/constants/app_data.dart';
import '../../common_widgets/custom_appbar.dart';
import 'components/drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final gridNews = AppData.getNews
        .map(
          (e) => StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Column(
              children: [
                Image.network(
                  e['mainImg'] as String,
                ),
                Text(
                  e['title'] as String,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        )
        .toList();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      key: scaffoldKey,
      endDrawer: const CustomDrawer(),
      appBar: CustomAppbar(
        titleText: 'Notícias',
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              scaffoldKey.currentState!.openEndDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: SizedBox(
                child: Column(
                  children: [
                    Image.network(
                      AppData.getNews.first['mainImg'] as String,
                    ),
                    Text(
                      AppData.getNews.first['title'] as String,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      AppData.getNews.first['content'] as String,
                      style: const TextStyle(fontWeight: FontWeight.normal),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
            ...gridNews,
          ],
        ),
      ),
    );
  }
}
