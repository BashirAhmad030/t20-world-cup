import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:t20_word_cup/models/schedule_model.dart';
import 'package:t20_word_cup/models/venue_model.dart';

class VenuesDataStore{
  static Future <List<VenueModel>> getAllVenues(BuildContext context) async {

    var venues = <VenueModel>[];
    var assetsBundle = DefaultAssetBundle.of(context);
    var data = await assetsBundle.loadString("assets/jdata/ttwentty.json");
    var jsonData = json.decode(data);
    var venueData = jsonData["Venues"] ;
    for (var loopData in  venueData){
      VenueModel venueModel = VenueModel.fromJson(loopData);
      venues.add(venueModel);
    }
    return venues;

  }


}

