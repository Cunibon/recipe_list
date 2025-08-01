import 'package:go_router/go_router.dart';
import 'package:recipe_list/widgets/dashboard_screen/dashboard_screen.dart';
import 'package:recipe_list/widgets/grocery_screen/grocery_routes.dart';
import 'package:recipe_list/widgets/grocery_screen/grocery_screen.dart';
import 'package:recipe_list/widgets/recipe_history_screen/recipe_history_screen.dart';
import 'package:recipe_list/widgets/recipe_screen/recipe_routes.dart';
import 'package:recipe_list/widgets/recipe_screen/recipe_screen.dart';
import 'package:recipe_list/widgets/recipe_shopping_screen/recipe_shopping_screen.dart';
import 'package:recipe_list/widgets/settings_screen/settings_screen.dart';
import 'package:recipe_list/widgets/shopping_screen/shopping_screen.dart';
import 'package:recipe_list/widgets/storage_screen/storage_screen.dart';

class RootRoutes {
  static GoRoute recipeRoute = GoRoute(
    path: "/recipes",
    builder: (context, state) => RecipeScreen(),
    routes: [MainRoutes.createRecipe, MainRoutes.recipeOverview],
  );
  static GoRoute groceriesRoute = GoRoute(
    path: "/groceries",
    builder: (context, state) => GroceryScreen(),
    routes: [GroceryRoutes.createGrocery],
  );
  static GoRoute shoppingRoute = GoRoute(
    path: "/shopping",
    builder: (context, state) => ShoppingScreen(),
    routes: [GroceryRoutes.createGrocery],
  );
  static GoRoute storageRoute = GoRoute(
    path: "/storage",
    builder: (context, state) => StorageScreen(),
    routes: [GroceryRoutes.createGrocery],
  );
  static GoRoute dashboardRoute = GoRoute(
    path: "/dashboard",
    builder: (context, state) => DashboardScreen(),
    routes: [],
  );
  static GoRoute recipeHistoryRoute = GoRoute(
    path: "/recipeHistory",
    builder: (context, state) => RecipeHistoryScreen(),
    routes: [],
  );
  static GoRoute recipeShoppingRoute = GoRoute(
    path: "/recipeShopping",
    builder: (context, state) => RecipeShoppingScreen(),
    routes: [],
  );
  static GoRoute settingsRoute = GoRoute(
    path: "/settings",
    builder: (context, state) => SettingsScreen(),
    routes: [],
  );
}
