import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  FirebaseService();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Adicionar dados
  Future<void> addData(
      String collectionPath, String docId, Map<String, dynamic> data) async {
    try {
      await _db.collection(collectionPath).doc(docId).set(data);
    } catch (error) {
      throw Exception('Erro ao adicionar dados: $error');
    }
  }

  // Ler dados
  Future<List<Map<String, dynamic>>> readData(String collectionPath) async {
    try {
      final QuerySnapshot snapshot = await _db.collection(collectionPath).get();

      return snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (error) {
      throw Exception('Erro ao ler dados: $error');
    }
  }

  // Atualizar dados
  Future<void> updateData(
      String collectionPath, String docId, Map<String, dynamic> data) async {
    try {
      await _db.collection(collectionPath).doc(docId).update(data);
    } catch (error) {
      throw Exception('Erro ao atualizar dados: $error');
    }
  }

  // Deletar dados
  Future<void> deleteData(String collectionPath, String docId) async {
    try {
      await _db.collection(collectionPath).doc(docId).delete();
    } catch (error) {
      throw Exception('Erro ao deletar dados: $error');
    }
  }
}
