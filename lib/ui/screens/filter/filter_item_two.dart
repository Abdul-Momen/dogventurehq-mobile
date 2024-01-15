import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/store_controller.dart';
import 'package:dogventurehq/ui/widgets/custom_rech_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../states/models/brands_model.dart';
import '../../widgets/helper.dart';

class FilterItemTwo extends StatefulWidget {
  // final BrandsModel model;

  final void Function(List<int>) setBrandsFn;
  final StoreController sCon;

  const FilterItemTwo({
    Key? key,
    // required this.model,
    required this.setBrandsFn,
    required this.sCon,
  }) : super(key: key);

  @override
  State<FilterItemTwo> createState() => _FilterItemTwoState();
}

class _FilterItemTwoState extends State<FilterItemTwo> {

  final List<int> _selectedBrands = List.empty(growable: true);

  @override
  void initState() {
    // TODO: implement initState
    // for (var element in widget.selectedBrands) {
    //   _selectedBrands.add(element);
    // }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (widget.sCon.brandsListLoadingFlag.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        if (widget.sCon.brandList.isEmpty) {
          return Center(child: Text(ConstantStrings.kNoData));
        } else {
          return Column(
            children: [
              SizedBox(
                height: 750.h,
                child: ListView.builder(
                  itemCount: widget.sCon.brandList.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Checkbox(
                          value: widget.sCon.brandList[index].value,
                          activeColor: Colors.blue,
                          checkColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          onChanged: (value) => setState(() {
                            //
                            widget.sCon.brandList[index].value=!widget.sCon.brandList[index].value;
                             value! ? _selectedBrands.add(widget.sCon.brandList[index].brandId) : _selectedBrands.remove(widget.sCon.brandList[index].brandId);

                            // if(_selectedBrands.contains(value)) {
                            //   _selectedBrands.remove(widget.sCon.brandList[index].brandId);
                            // } else {
                            //   _selectedBrands.add(widget.sCon.brandList[index].brandId);
                            // }

                            widget.setBrandsFn(_selectedBrands);
                            print(_selectedBrands);
                          }),
                        ),
                        addW(5.w),
                        Text(widget.sCon.brandList[index].title),
                      ],
                    );
                  },
                ),
              ),
              addH(10.h),
            ],
          );
        }
      }
    });
  }
}
