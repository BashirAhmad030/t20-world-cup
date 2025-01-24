
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:t20_word_cup/models/schedule_model.dart';

class ScheduleDataStore{
  static Future <List<ScheduleModel>> getAllMatches(BuildContext context) async {

    var matches = <ScheduleModel>[];
    var assetsBundle = DefaultAssetBundle.of(context);
    var data = await assetsBundle.loadString("assets/jdata/ttwentty.json");
    var jsonData = json.decode(data);
    var scheduleData = jsonData["Schedule"] ;
    for (var loopData in  scheduleData){
      ScheduleModel scheduleModel = ScheduleModel.fromJSON(loopData);
      matches.add(scheduleModel);
  }
    return matches ;

  }


}