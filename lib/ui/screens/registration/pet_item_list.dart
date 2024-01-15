import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/registration_controller.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardItem extends StatefulWidget {
  final void Function(List<int>) setPetsIdFn;
  final void Function(List<String>) setPetsNameFn;

  const CustomCardItem({
    Key? key,
    required this.setPetsIdFn,
    required this.setPetsNameFn,
  }) : super(key: key);

  @override
  State<CustomCardItem> createState() => _CustomCardItemState();
}

class _CustomCardItemState extends State<CustomCardItem> {
  final RegistrationController _registCon = Get.put(RegistrationController());

  final List<int> _selectedPetsID = List.empty(growable: true);
  final List<String> _selectedPetsName = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.bottomSheet(
          StatefulBuilder(
            builder: (
              BuildContext context,
              StateSetter setState /*You can rename this!*/,
            ) {
              return SizedBox(
                height: 300.h,
                child: Container(
                  width: double.infinity,
                  height: 300.h,
                  color: Colors.white,
                  child: Obx(
                    () {
                      if (_registCon.petLoadingFlag.value) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        if (_registCon.petList.isEmpty) {
                          return const Text('No data found');
                        } else {
                          return ListView.builder(
                            itemCount: _registCon.petList.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Checkbox(
                                            value:
                                                _registCon.petList[index].value,
                                            activeColor: Colors.blue,
                                            checkColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
                                            ),
                                            onChanged: (value) {
                                              updated(
                                                setState,
                                                index,
                                                value!,
                                              );
                                            },
                                          ),
                                          addW(10.w),
                                          CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 16.0,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                              child: Image.asset(
                                                'assets/images/animal_img.png',
                                              ),
                                            ),
                                          ),
                                          addW(10.w),
                                          Text(
                                            _registCon.petList[index].name,
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontFamily:
                                                  ConstantStrings.kAppFont,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      }
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 16.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.asset('assets/images/circular_img.png'),
                    ),
                  ),
                  addW(10.w),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 16.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.asset('assets/images/animal_img.png'),
                    ),
                  ),
                  addW(10.w),
                  SizedBox(
                    width: 160.w,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        _selectedPetsName.toString().replaceAll('[\\]', ''),
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontFamily: ConstantStrings.kAppFont,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Icon(Icons.keyboard_arrow_down_outlined),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updated(
    StateSetter updateState,
    int index,
    bool value,
  ) async {
    updateState(() {
      //
      _registCon.petList[index].value = !_registCon.petList[index].value;

      value
          ? _selectedPetsName.add(_registCon.petList[index].name)
          : _selectedPetsName.remove(_registCon.petList[index].name);

      value
          ? _selectedPetsID.add(_registCon.petList[index].profileId)
          : _selectedPetsID.remove(_registCon.petList[index].profileId);

      // if(_selectedBrands.contains(value)) {
      //   _selectedBrands.remove(widget.sCon.brandList[index].brandId);
      // } else {
      //   _selectedBrands.add(widget.sCon.brandList[index].brandId);
      // }
      widget.setPetsIdFn(_selectedPetsID);
      widget.setPetsNameFn(_selectedPetsName);
      setState(() {});
    });
  }
}
