import 'package:drift/drift.dart';
import 'package:recipe_list/data/recipe_shopping_data.dart';
import 'package:recipe_list/drift/database.dart';
import 'package:recipe_list/repos/repo.dart';

class RecipeShoppingRepoDrift extends Repo<RecipeShoppingData> {
  RecipeShoppingRepoDrift(super.db);

  @override
  $RecipeShoppingTableTable get table => db.recipeShoppingTable;

  @override
  SimpleSelectStatement<$RecipeShoppingTableTable, RecipeShoppingTableData>
  get baseQuery {
    final query = db.select(table);

    query.orderBy([
      (u) => OrderingTerm(expression: u.date, mode: OrderingMode.desc),
    ]);
    return query;
  }

  @override
  Future<Map<String, RecipeShoppingData>> get() async {
    final rows = await baseQuery.get();
    return {for (final row in rows) row.id: RecipeShoppingData.fromRow(row)};
  }

  @override
  Stream<Map<String, RecipeShoppingData>> stream() {
    return baseQuery.watch().map((rows) {
      return {for (final row in rows) row.id: RecipeShoppingData.fromRow(row)};
    });
  }

  @override
  Future<void> add(RecipeShoppingData newData) async {
    await db
        .into(table)
        .insert(newData.toTableCompanion(), mode: InsertMode.insertOrReplace);
  }

  @override
  Future<void> delete(String id) async {
    await (db.delete(table)..where((t) => t.id.equals(id))).go();
  }

  @override
  Future<void> clear() async {
    await db.delete(table).go();
  }
}
