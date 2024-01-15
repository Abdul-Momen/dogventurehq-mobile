import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/screens/filter/filter_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../states/models/parent_category.dart';

class FilterItem extends StatelessWidget {

 final ParentCategory parentCategoryModel;
   FilterItem({Key? key, required this.parentCategoryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(FilterPageTwo());
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(parentCategoryModel.name,
              style: TextStyle(
                fontSize: 21.sp,
                fontFamily: ConstantStrings.kAppFont
              ),),
              Icon(Icons.keyboard_arrow_right_sharp),
            ],
          ),
        ),
      ),
    );
  }
}
