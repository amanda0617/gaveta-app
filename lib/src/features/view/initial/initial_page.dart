import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../route/app_pages.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green.shade300,
        body: Container(
          alignment: Alignment.center,
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/soccer-field.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/marta-avatar.png'),
                const Text(
                  'GAVETA',
                  style: TextStyle(fontSize: 48),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Digite seu email...',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const Text(
                  'Digite seu e-mail e receba notícias diariamente!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[900],
                        foregroundColor: Colors.white),
                    onPressed: () {
                      // TODO: FAZER REQUISIÇÃO PARA POST DE EMAIL
                      Get.offAndToNamed(PagesRoutes.baseRoute);
                    },
                    child: const Text('Enviar'),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offAndToNamed(PagesRoutes.baseRoute);
                    },
                    child: const Text(
                      'Pular etapa',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
