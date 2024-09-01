import 'package:flutter/material.dart';
import 'package:recepie_app/Recipe.dart';
import 'Http_service.dart';
import 'Data_service.dart';
import 'RecipeDetailPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DataService _dataService = DataService();
  List<Recipie> _recipes = [];
  List<String> _mealTypes = ['Snack', 'Breakfast', 'Lunch', 'Dinner'];
  String _selectedMealType = 'Snack';

  @override
  void initState() {
    super.initState();
    _fetchRecipes();
  }

  void _fetchRecipes() async {
    List<Recipie>? recipes = await _dataService.getRecipes();
    if (recipes != null) {
      setState(() {
        _recipes = recipes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RecipBook'),
      ),
      body: Column(
        children: [
          _buildMealTypeSelector(),
          Expanded(child: _buildRecipeList()),
        ],
      ),
    );
  }

  Widget _buildMealTypeSelector() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _mealTypes.map((mealType) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ChoiceChip(
              label: Text(mealType),
              selected: _selectedMealType == mealType,
              onSelected: (selected) {
                setState(() {
                  _selectedMealType = mealType;
                });
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildRecipeList() {
    List<Recipie> filteredRecipes = _recipes
        .where((recipe) => recipe.mealType.contains(_selectedMealType))
        .toList();

    return ListView.builder(
      itemCount: filteredRecipes.length,
      itemBuilder: (context, index) {
        Recipie recipe = filteredRecipes[index];
        return ListTile(
          leading: Image.network(recipe.image),
          title: Text(recipe.name),
          subtitle:
              Text('${recipe.cuisine} \nDifficulty: ${recipe.difficulty}'),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(recipe.rating.toString()),
              Icon(Icons.star, color: Colors.amber),
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipeDetailPage(recipe: recipe),
              ),
            );
          },
        );
      },
    );
  }
}
