import 'package:dogventurehq/states/controllers/perent_category_controller.dart';
import 'package:dogventurehq/ui/screens/filter/filter_item.dart';
import 'package:dogventurehq/ui/widgets/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class FilterPageOne extends StatefulWidget {
  const FilterPageOne({Key? key}) : super(key: key);

  @override
  State<FilterPageOne> createState() => _FilterPageOneState();
}

class _FilterPageOneState extends State<FilterPageOne> {

  final ParentCategoryController _parentCategoryController = Get.put(
      ParentCategoryController());

  @override
  void initState() {
    // TODO: implement initState

    _parentCategoryController.getParentCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor("#F98C10"),
        ),
        toolbarHeight: -20.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 900.h,
              width: double.infinity,
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  ListView(
                    children: [
                      addH(30.h),

                      Padding(
                        padding: const EdgeInsets.only(top: 108.0),
                        child: Obx(() {
                          if(_parentCategoryController.parentCategoryLoadingFlag.value){
                            return Center(child: CircularProgressIndicator());
                          }else{
                            if(_parentCategoryController.filterCategoryList.isNotEmpty){
                              return ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  physics: const ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: _parentCategoryController.filterCategoryList.length,
                                  itemBuilder: (context, index) {
                                    return FilterItem(parentCategoryModel: _parentCategoryController.filterCategoryList[index],);
                                  });
                            }else{
                              return Text('list Empty.');
                            }
                          }
                        }),
                      ),
                    ],
                  ),
                  const CustomTitlebar(
                    title: 'Filter',
                    img_bg: 'assets/images/store_bg.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
