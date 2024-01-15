import 'package:dogventurehq/states/controllers/store_controller.dart';
import 'package:dogventurehq/ui/screens/filter/filter_item.dart';
import 'package:dogventurehq/ui/screens/filter/filter_item_two.dart';
import 'package:dogventurehq/ui/screens/store/filter_product/filter_product.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../states/models/brands_model.dart';
import '../thank_you/thank_you.dart';

class FilterPageTwo extends StatefulWidget {
  const FilterPageTwo({Key? key}) : super(key: key);

  @override
  State<FilterPageTwo> createState() => _FilterPageTwoState();
}

class _FilterPageTwoState extends State<FilterPageTwo> {
  final StoreController _storeController = Get.put(StoreController());

  List<int> _brandList = List.empty(growable: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _storeController.getBrandsList();
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
                      Padding(
                        padding: EdgeInsets.only(top: 138.0.h),
                        child: FilterItemTwo(
                          sCon: _storeController, setBrandsFn: (List<int> list ) {
                            print(list);
                            _brandList=list;
                        },

                        ),
                        // child: Obx(() {
                        //   if (_storeController.brandsListLoadingFlag.value) {
                        //     return const Center(
                        //         child: CircularProgressIndicator());
                        //   } else {
                        //     if (_storeController.brandList.isNotEmpty) {
                        //       return ListView.builder(
                        //           scrollDirection: Axis.vertical,
                        //           physics: const ClampingScrollPhysics(),
                        //           shrinkWrap: true,
                        //           itemCount: _storeController.brandList.length,
                        //           itemBuilder: (context, index) {
                        //             return
                        //           });
                        //     } else {
                        //       return const Text('Brand list Empty');
                        //     }
                        //   }
                        // }),
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
      bottomSheet: Padding(
        padding:
            const EdgeInsets.only(top: 20.0, left: 20, right: 20, bottom: 10),
        child: Obx(() {
          if (_storeController.brandsListLoadingFlag.value) {
            return Text('');
          } else {
            if (_storeController.brandList.isNotEmpty) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(FilterProductPage(
                          searchValue: '',
                          brandsList: _brandList,
                        ));
                        

                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green, // background (button) color
                        padding: const EdgeInsets.only(
                            left: 40.0,
                            right: 40,
                            top: 16,
                            bottom: 16), // foreground (text) color
                      ),
                      child: const Text(
                        'Apply',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  addW(10.w),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: (){
                        Get.back();
                        Get.back();
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 1.0, color: Colors.red),
                        minimumSize: Size.fromHeight(50),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Text('');
            }
          }
        }),
      ),
    );
  }
}
