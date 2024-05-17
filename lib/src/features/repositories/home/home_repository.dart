abstract interface class HomeRepository {
  Future<List<Map<String,dynamic>>?> fetchNews();
}
