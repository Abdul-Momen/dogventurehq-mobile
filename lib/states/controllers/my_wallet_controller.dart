import 'package:get/get.dart';

import '../models/my_wallet_model.dart';
import '../models/my_wallet_transection_model.dart';
import '../services/my_wallet_services.dart';

class MyWalletController extends GetxController {
  RxBool myWalletLoadingFlag = true.obs;
  RxBool myWalletTransactionLoadingFlag = true.obs;

  MyWalletModel? myWalletObj;
  List<MyWalletTransectionModel> transactionList = <MyWalletTransectionModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getWallet();
  }

  void getWallet() async {
    myWalletLoadingFlag.value = true;
    try {
      myWalletObj = await WalletService.getWallet();
    } finally {
      myWalletLoadingFlag.value = false;
    }
  }

  void getWalletTransaction(String walletId) async {
    myWalletTransactionLoadingFlag.value = true;
    try {
      transactionList = await WalletService.getWalletTransaction(walletId);
    } finally {
      myWalletTransactionLoadingFlag.value = false;
    }
  }
}
