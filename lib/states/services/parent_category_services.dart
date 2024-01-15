import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/models/parent_category.dart';
import 'package:dogventurehq/states/services/base_client.dart';

class ParentCategoryService{
  static Future<List<ParentCategory>> getParentCategory() async {
    var response = await BaseClient().get(
      ConstantStrings.kParentCategoryApi,
    );
    List<ParentCategory> obj = parentCategoryFromJson(response.toString());
    return obj;
  }
}