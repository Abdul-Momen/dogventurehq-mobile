import 'package:dogventurehq/states/controllers/store_controller.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/filter_product_model.dart';
import 'package:dogventurehq/states/models/parent_category.dart';
import 'package:dogventurehq/states/models/search_model.dart';
import 'package:dogventurehq/ui/screens/store/filter_product/filter_product_item.dart';
import 'package:dogventurehq/ui/widgets/custom_product_item.dart';
import 'package:dogventurehq/ui/screens/filter/filter_one.dart';
import 'package:dogventurehq/ui/widgets/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../states/models/brands_model.dart';

class FilterProductPage extends StatefulWidget {
  static String routeName = '/filter';

  String? searchValue;
  final List<int>? brandsList;
  int? pCatId;

   FilterProductPage({Key? key,  this.searchValue, this.brandsList, this.pCatId}) : super(key: key);

  @override
  State<FilterProductPage> createState() => _StorePageState();
}

class _StorePageState extends State<FilterProductPage> {
  final StoreController _storeController = Get.put(StoreController());
  late ScrollController _controller;

  final TextEditingController _editingController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    _controller = ScrollController();
    _controller.addListener(_scrollListener);

    _editingController.text=widget.searchValue!;

    SearchModel searchModel = SearchModel(
      productMasterId: null,
      quickSearch:widget.searchValue??null,
      page: 1,
      pageSize: 9,
      productShortingTypeId: null,
      languageId: 4,
      countryId: null,
      currencyId: null,
      priceHighToLow: false,
      categoryIds: [widget.pCatId],
      customerId: 0,
      categorySubIds: [],
      brandIds: widget.brandsList??[],
      totalRecord: 0,
      viewType: "",
      sortBy: null,
      maxPrice: 10000,
      minPrice: 0,
      priceFrom: 0,
      priceTo: 0,
      pageSizefilter: 0,
      sortById: 0,
      productListRequestModels: [],);
    _storeController.filterProduct(searchModel);

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
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addH(15.h),
                      Padding(
                        padding: const EdgeInsets.only(top: 100.0),
                        child: Row(
                          children: [
                            Flexible(
                              flex: 6,
                              child: Container(
                                height: 60.h,
                                child: Card(
                                  child: Center(
                                    child: ListTile(
                                      leading: const Icon(Icons.search),
                                      title: TextField(
                                         controller: _editingController,
                                          decoration:
                                          const InputDecoration(
                                              hintText: 'Search',
                                              border:
                                              InputBorder.none),
                                          onChanged: (value) {

                                            SearchModel searchModel = SearchModel(
                                              productMasterId: null,
                                              quickSearch: value,
                                              page: 1,
                                              pageSize: 9,
                                              productShortingTypeId: null,
                                              languageId: 4,
                                              countryId: null,
                                              currencyId: null,
                                              priceHighToLow: false,
                                              categoryIds: [],
                                              customerId: 0,
                                              categorySubIds: [],
                                              brandIds: [],
                                              totalRecord: 0,
                                              viewType: "",
                                              sortBy: null,
                                              maxPrice: 10000,
                                              minPrice: 0,
                                              priceFrom: 0,
                                              priceTo: 0,
                                              pageSizefilter: 0,
                                              sortById: 0,
                                              productListRequestModels: [],);
                                            _storeController.filterProduct(searchModel);

                                          }),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                height: 60.h,
                                width: 60.w,
                                color: Colors.white,
                                child: InkWell(
                                    onTap: () {
                                      Get.to(const FilterPageOne());
                                    },
                                    child: Image.asset(
                                        'assets/images/filter_img.png')),
                              ),
                            ),
                          ],
                        ),
                      ),
                      addH(10.h),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     CustomBtn(
                      //       btnFn: () {},
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
                        height: 690.h,
                        width: double.infinity,
                        child: Obx(() {if (_storeController
                              .filterProductListLoadingFlag.value) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else {
                            if (_storeController.filterProductObj!=null) {

                              if( _storeController.filterProductObj!.productListRequestModels.isNotEmpty){
                                return GridView.count(
                                  controller: _controller, //new line
                                  crossAxisCount: 2,
                                  childAspectRatio:
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .height /
                                      (13* 100),
                                  children: List.generate(
                                      _storeController.filterProductObj!.
                                      productListRequestModels.length, (index) {
                                    return _storeController.filterProductObj!.productListRequestModels.isNotEmpty? CustomFilterProductItem(
                                      productModel: _storeController
                                          .filterProductObj!
                                          .productListRequestModels[index],

                                    ): const Center(child: CircularProgressIndicator());
                                    //bohash.org api provide you different images for any number you are giving
                                  }),
                                );

                              }else{
                                Text('List is Empty');
                              }
                               return Text('');
                            } else {
                              return const Text('Empty list');
                            }
                          }
                        }),
                      ),
                    ],
                  ),
                ),
                const CustomTitlebar(
                  title: 'Filter Product',
                  img_bg: 'assets/images/store_bg.png',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() { //you can do anything here
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() { //you can do anything here
      });
    }
  }
}
