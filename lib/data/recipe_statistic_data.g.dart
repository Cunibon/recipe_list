// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_statistic_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecipeStatisticData _$RecipeStatisticDataFromJson(Map<String, dynamic> json) =>
    _RecipeStatisticData(
      id: json['id'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      recipeId: json['recipeId'] as String,
    );

Map<String, dynamic> _$RecipeStatisticDataToJson(
  _RecipeStatisticData instance,
) => <String, dynamic>{
  'id': instance.id,
  'startDate': instance.startDate.toIso8601String(),
  'endDate': instance.endDate.toIso8601String(),
  'recipeId': instance.recipeId,
};
