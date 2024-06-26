import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/custom_appbar.dart';
import '../../controllers/home/home_controller.dart';
import 'components/drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final controller = Get.find<HomeController>();
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
      body: Obx(
        () => SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.all(8),
                      sliver: SliverToBoxAdapter(
                        child: SizedBox(
                          child: Column(
                            children: [
                              Image.network(
                                controller.newsList.first.image ?? '-',
                              ),
                              Text(
                                controller.newsList.first.title ?? '-',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                controller.newsList.first.description ?? '-',
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(8),
                      sliver: SliverGrid.extent(
                        crossAxisSpacing: 4,
                        maxCrossAxisExtent:
                            (MediaQuery.sizeOf(context).width / 2),
                        children: controller.newsList
                            .skip(1)
                            .map((e) => SizedBox(
                                  child: Column(
                                    children: [
                                      Image.network(
                                        e.image ?? '-',
                                      ),
                                      Text(
                                        e.title ?? '-',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

/* SliverFillRemaining(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: AppData.getNews.length - 1,
                  itemBuilder: (context, index)  {


                    return SizedBox(
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
                  );}
                ),
              ), */

/* final gridNews = AppData.getNews
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

SingleChildScrollView(
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
      ), */
