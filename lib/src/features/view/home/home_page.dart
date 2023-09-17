import 'package:flutter/material.dart';

import '../../../core/constants/app_data.dart';
import '../../common_widgets/custom_appbar.dart';
import 'components/drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(8),
              sliver: SliverToBoxAdapter(
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
            ),
            SliverPadding(
              padding: const EdgeInsets.all(8),
              sliver: SliverFillRemaining(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: AppData.getNews.length - 1,
                  itemBuilder: (context, index) => SizedBox(
                    child: Column(
                      children: [
                        Image.network(
                          AppData.getNews[index + 1]['mainImg'] as String,
                        ),
                        Text(
                          AppData.getNews[index + 1]['title'] as String,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
