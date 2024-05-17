import 'dart:developer';

import '../../../core/services/firebase_service.dart';
import './home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final FirebaseService firebaseService;
  HomeRepositoryImpl({required this.firebaseService});

  @override
  Future<List<Map<String, dynamic>>?> fetchNews() async {
    try {
      final result = await firebaseService.readData('/noticias');
      return result;
    } on Exception catch (e, s) {
      log('[ERRO] - Não foi possível buscar notícias',
          name: 'FetchNews', error: e, stackTrace: s);
      return null;
    }
  }
}
