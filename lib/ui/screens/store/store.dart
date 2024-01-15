import 'package:dogventurehq/states/controllers/perent_category_controller.dart';
import 'package:dogventurehq/states/controllers/store_controller.dart';
import 'package:dogventurehq/ui/screens/filter/filter_one.dart';
import 'package:dogventurehq/ui/screens/store/filter_product/filter_product.dart';
import 'package:dogventurehq/ui/screens/store/top_category_item.dart';
import 'package:dogventurehq/ui/widgets/custom_product_item.dart';
import 'package:dogventurehq/ui/widgets/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../constants/strings.dart';

class StorePage extends StatefulWidget {
  static String routeName = '/store';

  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  // final StoreController _storeController=Get.find<StoreController>();
  final StoreController _storeController = Get.put(StoreController());
  final ParentCategoryController _parentCategoryController=Get.put(ParentCategoryController());

  @override
  void initState() {
    // TODO: implement initState
    _storeController.getProductList();
    _storeController.getNewArrivalProductList();
    _storeController.getTopProductList();
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
                      Padding(
                        padding: const EdgeInsets.only(top: 70.0),
                        child: Image.asset(
                          fit: BoxFit.fill,
                          width: double.infinity,
                          height: 300.h,
                          'assets/images/store_banner.png',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            addH(15.h),
                            SizedBox(
                              child: Card(
                                child: ListTile(
                                  leading: const Icon(Icons.search),
                                  title: TextField(
                                      // controller: controller,
                                      decoration: const InputDecoration(
                                          hintText: 'Search',
                                          border: InputBorder.none),
                                      onChanged: (value) {
                                        Get.to(FilterProductPage(
                                          searchValue: value,
                                        ));
                                        // Get.toNamed(FilterProductPage.routeName,arguments: [value]);

                                      }),
                                  trailing: InkWell(
                                    onTap: (){
                                      Get.to(const FilterPageOne());
                                    },
                                    child: Image.asset(
                                      fit: BoxFit.fill,
                                      width: 30.w,
                                      height: 30.h,
                                      'assets/images/filter_img.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            addH(10.h),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     CustomBtn(
                            //       btnFn: () {
                            //         Get.to(DogFoodPage());
                            //       },
                            //       btnText: 'DOG',
                            //       btnBgClr: Colors.amber.shade800,
                            //       txtSize: 13.sp,
                            //       btnSize: Size(90.w, 38.h),
                            //       imgUrl: 'assets/svg/dog.svg',
                            //       imgHeight: 30.h,
                            //     ),
                            //     addW(10.w),
                            //     CustomBtn(
                            //       btnFn: () {},
                            //       btnText: 'CAT',
                            //       btnBgClr: Colors.white,
                            //       txtColor: Colors.black,
                            //       borderColor: Colors.grey.shade200,
                            //       txtSize: 13.sp,
                            //       btnSize: Size(90.w, 38.h),
                            //       imgUrl: 'assets/svg/cat.svg',
                            //       imgHeight: 30.h,
                            //     ),
                            //     addW(10.w),
                            //     CustomBtn(
                            //       btnFn: () {},
                            //       btnText: 'OTHERS',
                            //       btnBgClr: Colors.white,
                            //       txtColor: Colors.black,
                            //       borderColor: Colors.grey.shade200,
                            //       txtSize: 13.sp,
                            //       btnSize: Size(80.w, 38.h),
                            //     ),
                            //   ],
                            // ),
                            SizedBox(
                              width: 428.w,
                              height: 60.h,
                              child: Stack(
                                alignment: AlignmentDirectional.bottomCenter,
                                children: [
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    right: 0,
                                    child: Image.asset(
                                      'assets/images/featured_product.png',
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0.h,
                                    right: 10.w,
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'View all',
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: Colors.amber.shade800,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            addH(10.h),
                            SizedBox(
                                width: double.infinity,
                                height: 360.h,
                                child: Obx(() {
                                  if (_storeController
                                      .productListLoadingFlag.value) {
                                    // print(_eventCon.eventlist.toString());
                                    return const Center(
                                        child: const CircularProgressIndicator());
                                  } else {
                                    if (_storeController.productList.isEmpty) {
                                      return const Text('No data found');
                                    } else {
                                      return ListView.builder(
                                        itemCount:
                                            _storeController.productList.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return CustomProductItem(
                                            productModel: _storeController
                                                .productList[index],
                                          );
                                        },
                                      );
                                    }
                                  }
                                })),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/store_featured_bd.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                        height: 600.h,
                        width: double.infinity.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 428.w,
                              height: 60.h,
                              child: Stack(
                                alignment: AlignmentDirectional.bottomCenter,
                                children: [
                                  Stack(
                                    children: [
                                      // Image.asset(
                                      //   'assets/images/title_login.png',
                                      //   width: double.infinity,
                                      //   height: 60.h,
                                      //   fit: BoxFit.fill,
                                      // ),
                                      Positioned(
                                        top: 15.h,
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                        child: Column(
                                          children: [
                                            Center(
                                                child: Text(
                                              'New Arrival Product ',
                                              style: TextStyle(
                                                  fontFamily: ConstantStrings
                                                      .kAppFont,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 30.sp),
                                            )),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Positioned(
                                    bottom: 0.h,
                                    right: 10.w,
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'View all',
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            addH(10.h),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: SizedBox(
                                width: double.infinity,
                                height: 340.h,
                                child: Obx(() {
                                  if (_storeController
                                      .newArrivalProductListLoadingFlag.value) {
                                    // print(_eventCon.eventlist.toString());
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else {
                                    if (_storeController.newArrivalProductList.isEmpty) {
                                      return const Center(child: Text('Empty list'));
                                    } else {
                                      return ListView.builder(
                                        itemCount:
                                            _storeController.newArrivalProductList.length,
                                        scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return CustomProductItem(
                                            productModel: _storeController
                                                .newArrivalProductList[index],
                                          );
                                        },
                                      );
                                    }
                                  }
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            addH(15.h),
                            SizedBox(
                              width: 428.w,
                              height: 60.h,
                              child: Stack(
                                alignment: AlignmentDirectional.bottomCenter,
                                children: [
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    right: 0,
                                    child: Image.asset(
                                      'assets/images/top_categories.png',
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0.h,
                                    right: 10.w,
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'View all',
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: Colors.amber.shade800,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            addH(10.h),
                            SizedBox(
                                width: double.infinity,
                                height: 130.h,
                                child: Obx(() {
                                  if (_parentCategoryController.parentCategoryLoadingFlag.value) {
                                    // print(_eventCon.eventlist.toString());
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else {
                                    if (_parentCategoryController.filterCategoryList.isEmpty) {
                                      return const Center(child: Text('Empty list'));
                                    } else {
                                      return ListView.builder(
                                        itemCount:
                                        _parentCategoryController.filterCategoryList.length,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return TopCategoryItem(model: _parentCategoryController.filterCategoryList[index],);
                                        },
                                      );
                                    }
                                  }
                                })),
                            addH(10.h),
                            SizedBox(
                              width: 428.w,
                              height: 60.h,
                              child: Stack(
                                alignment: AlignmentDirectional.bottomCenter,
                                children: [
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    right: 0,
                                    child: Image.asset(
                                      'assets/images/top_product_bg.png',
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0.h,
                                    right: 10.w,
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'View all',
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: Colors.amber.shade800,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            addH(10.h),
                            SizedBox(
                                width: double.infinity,
                                height: 360.h,
                                child: Obx(() {
                                  if (_storeController
                                      .topProductListLoadingFlag.value) {
                                    // print(_eventCon.eventlist.toString());
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else {
                                    if (_storeController.topProductList.isEmpty) {
                                      return const Center(child: Text('Empty list'));
                                    } else {
                                      return ListView.builder(
                                        itemCount:
                                            _storeController.topProductList.length,
                                        scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return _storeController.topProductList.isNotEmpty? CustomProductItem(
                                            productModel: _storeController
                                                .topProductList[index],
                                          ):  const CircularProgressIndicator();
                                        },
                                      );
                                    }
                                  }
                                })),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const CustomTitlebar(
                    title: 'Store',
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
