import 'package:dogventurehq/states/models/parent_category.dart';
import 'package:dogventurehq/ui/screens/store/filter_product/filter_product.dart';
import 'package:dogventurehq/ui/widgets/custom_image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/strings.dart';
import '../../widgets/helper.dart';

class TopCategoryItem extends StatelessWidget {
  final ParentCategory model;
  const TopCategoryItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 128.h,
      child: InkWell(
        onTap: (){
          Get.to(FilterProductPage(searchValue: '',pCatId: model.categoryId ));
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 45.h,
                width: 70.w, // fixed width and height
                child:ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: CustomImageNetwork(imageUrl: model.largeImage,),
                ),
              ),
              addH(10.h),
              Center(
                child: Text(
                  model.name,
                  style: TextStyle(
                    fontFamily: ConstantStrings.kAppFont,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
