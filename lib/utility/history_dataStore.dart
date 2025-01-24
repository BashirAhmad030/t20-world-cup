

 import 'dart:convert';
import 'package:flutter/cupertino.dart';

import '../models/history_model.dart';

class HistoryDataStor{

  static Future <List<HistoryModel>> getAllHistory (BuildContext context) async {

    var histories = <HistoryModel> [] ;
    // Locate path
    var assetsBundle = DefaultAssetBundle.of(context) ;
    // location assigned
    var data = await assetsBundle.loadString('assets/jdata/ttwentty.json');
    // Now to get The jsonData file
    var jsonData = json.decode(data);
    // Now the Json Data load which name History
    var historyData = jsonData["History"] ;
    for (var loopData in historyData){
      HistoryModel historyModel = HistoryModel.fromJson(loopData);
      histories.add(historyModel);
    }
    return histories ;

  }
 }