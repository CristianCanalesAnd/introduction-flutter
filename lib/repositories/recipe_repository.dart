import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:introduction_flutter/models/recipe.dart';

class RecipeRepository {
  final FirebaseFirestore _firebaseFirestore;

  RecipeRepository({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  Future<List<Recipe>> loadItems() async {
    QuerySnapshot snapshot =
        await _firebaseFirestore.collection("Recipes").get();

    List<Map<String, dynamic>> items = [];
    for (var doc in snapshot.docs) {
      items.add(doc.data()! as Map<String, dynamic>);
    }

    return items.map((e) => Recipe.fromDocument(e)).toList();
  }
}
