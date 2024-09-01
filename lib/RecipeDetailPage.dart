import 'package:flutter/material.dart';
import 'Recipe.dart';

class RecipeDetailPage extends StatelessWidget {
  final Recipie recipe;

  RecipeDetailPage({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RecipBook'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(recipe.image),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${recipe.cuisine}, ${recipe.difficulty}',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                recipe.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                        'Prep Time: ${recipe.prepTimeMinutes} Minutes | Cook Time: ${recipe.cookTimeMinutes} Minutes'),
                  ),
                  Text('${recipe.rating} ⭐ | ${recipe.reviewCount} Reviews')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ingredients',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ...recipe.ingredients.map((ingredient) => ListTile(
                        leading: Icon(Icons.check_box, color: Colors.black),
                        title: Text(ingredient),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Instructions',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ...recipe.instructions.map((instruction) => ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.black,
                          child: Text(
                              '${recipe.instructions.indexOf(instruction) + 1}',
                              style: TextStyle(color: Colors.white)),
                        ),
                        title: Text(instruction),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
