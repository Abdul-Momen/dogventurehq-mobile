import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/add_pet_model.dart';
import 'package:dogventurehq/states/models/my_wallet_model.dart';
import 'package:dogventurehq/states/models/pet_breed_model.dart';
import 'package:dogventurehq/states/models/pet_list_model.dart';
import 'package:dogventurehq/states/models/pet_type_model.dart';
import 'package:dogventurehq/states/services/base_client.dart';
import 'package:http/http.dart' as http;

import '../models/my_wallet_transection_model.dart';

class WalletService {
  //get wallet data
  static Future<MyWalletModel> getWallet() async {
    var response = await BaseClient().get(
      '${ConstantStrings.kWalletApi}${Preference.getUserId()}',
    );
    MyWalletModel obj = myWalletModelFromJson(response.toString());
    return obj;
  }

  //get Transaction  data
  static Future<List<MyWalletTransectionModel>> getWalletTransaction(
      String walletId) async {
    var response = await BaseClient().get(
      ConstantStrings.kWalletTransactionApi + walletId,
    );
    List<MyWalletTransectionModel> obj =
        myWalletTransectionModelFromJson(response.toString());
    return obj;
  }
}
