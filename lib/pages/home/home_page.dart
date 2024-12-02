import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:introduction_flutter/main.dart';
import 'package:introduction_flutter/models/recipe.dart';
import 'package:introduction_flutter/pages/widgets/recipe_widget.dart';
import 'package:introduction_flutter/repositories/recipe_repository.dart';
import 'package:introduction_flutter/widgets/custom_searchbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchBarController = TextEditingController();
  String searchRecipeName = "";
  List<Recipe> recipes = [];
  bool isLoading = true;

  @override
  void initState() {
    loadRecipes();
    super.initState();
  }

  loadRecipes() async {
    RecipeRepository recipeRepository = RecipeRepository(
      firebaseFirestore: FirebaseFirestore.instanceFor(app: firebaseApp),
    );
    recipes = await recipeRepository.loadItems();

    isLoading = false;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: buildAppBar(),
        body: buildBody(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text(
        "Recipes",
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
      elevation: 0,
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        buildSearchBar(),
        isLoading ? buildProgressIndicator() : buildRecipes(),
      ],
    );
  }

  Widget buildProgressIndicator() {
    return const Expanded(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
      child: CustomSearchBar(
        controller: _searchBarController,
        onChangedSearchNameText: (value) {
          setState(() {
            searchRecipeName = value.toLowerCase();
          });
        },
      ),
    );
  }

  Widget buildRecipes() {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: recipes
                .where((r) => r.title.toLowerCase().contains(searchRecipeName))
                .map((e) => RecipeWidget(
                      title: e.title,
                      description: e.description,
                      assetUrl: e.assetUrl,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchBarController.dispose();
    super.dispose();
  }
}
