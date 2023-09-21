import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../route/app_pages.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade800,
      width: MediaQuery.sizeOf(context).width * 0.65,
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DrawerItem(
              onTap: () {
                Navigator.pop(context);
                Get.toNamed(PagesRoutes.matches);
              },
              icon: Image.asset('assets/icons/partidas-menu.png'),
              title: 'Partidas',
            ),
            DrawerItem(
              onTap: () {
                Navigator.pop(context);
                Get.toNamed(PagesRoutes.players);
              },
              icon: Image.asset('assets/icons/jogadoras-menu.png'),
              title: 'Jogadoras',
            ),
            DrawerItem(
              onTap: () {
                Navigator.pop(context);
                Get.toNamed(PagesRoutes.statistics);
              },
              icon: Image.asset('assets/icons/estatistica-menu.png'),
              title: 'Estatística',
            ),
            DrawerItem(
              onTap: () {
                Navigator.pop(context);
                Get.toNamed(PagesRoutes.placing);
              },
              icon: Image.asset('assets/icons/classificacao-menu.png'),
              title: 'Classificação',
            ),
          ],
        ),
      )),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final Widget icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 18, color: Colors.white);
    return ListTile(
      onTap: onTap,
      leading: icon,
      title: Text(
        title,
        style: textStyle,
      ),
    );
  }
}
