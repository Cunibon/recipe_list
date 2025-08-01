import 'package:recipe_list/data/recipe_data.dart';
import 'package:recipe_list/data/recipe_shopping_data.dart';
import 'package:recipe_list/repos/repo.dart';

class RecipeShoppingModifier {
  RecipeShoppingModifier(this.repo);
  final Repo<RecipeShoppingData> repo;

  Future<void> addRecipe(RecipeData newData) async {
    final recipeShoppingData = RecipeShoppingData.fromRecipe(newData);
    await repo.add(recipeShoppingData);
  }
}
