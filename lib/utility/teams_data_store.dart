

import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../models/teams_model.dart';

class TeamsDataStore{

  static Future<List<TeamsModel>> getAllTeams(BuildContext context)async {

    var teams = <TeamsModel> [] ;
    var assetsBundle = DefaultAssetBundle.of(context) ;
    var data = await assetsBundle.loadString("assets/jdata/ttwentty.json") ;
    var jsonData = json.decode(data) ;
    var teamsData = jsonData["Teams"] ;
    for (var loopData in teamsData){
      TeamsModel teamsModel = TeamsModel.fromJson(loopData);
      teams .add(teamsModel) ;
    }
    return teams ;

  }
}