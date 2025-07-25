import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_list/data/recipe_data.dart';
import 'package:recipe_list/root_routes.dart';
import 'package:recipe_list/widgets/generic/navigation_drawer_scaffold.dart';
import 'package:recipe_list/widgets/generic/notifier_future_builder.dart';
import 'package:recipe_list/widgets/generic/searchable_list.dart';
import 'package:recipe_list/widgets/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipe_list/widgets/recipe_screen/compact_recipe_item.dart';
import 'package:recipe_list/widgets/recipe_screen/providers/recipe_notifier.dart';
import 'package:recipe_list/widgets/recipe_screen/recipe_routes.dart';

class RecipeScreen extends ConsumerWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncRecipe = ref.watch(recipeNotifierProvider);
    final asyncGrocery = ref.watch(groceryNotifierProvider);

    return NavigationDrawerScaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go(
          "${RootRoutes.recipeRoute.path}/${MainRoutes.createRecipe.path}",
        ),
        child: Icon(Icons.add),
      ),
      body: NotifierFutureBuilder(
        futures: [asyncRecipe, asyncGrocery],
        childBuilder: () => SearchableList(
          type: "Recipe",
          items: asyncRecipe.value!.values.toList(),
          toSearchable: (item) => item.toReadable(asyncGrocery.value!),
          toWidget: (item) => CompactRecipeItem(data: item),
          sort: (a, b) => a.title.compareTo(b.title),
          bottomPadding: 78,
        ),
      ),
    );
  }
}
