import 'package:flutter/material.dart';

import 'package:t20_word_cup/screens/history_screen.dart';
import 'package:t20_word_cup/screens/schedule_screen.dart';
import 'package:t20_word_cup/screens/teams_home_screen.dart';
import 'package:t20_word_cup/screens/venue_home_screen.dart';

import '../widgets/homeScreen_widgets_Items.dart';
import 'package:url_launcher/url_launcher.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: const Text(
          'T20 World Cup', style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView(

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2 ,
            mainAxisSpacing: 15 ,
            crossAxisSpacing: 15,

          ),
          children:  [
            HomeScreenItems(
                title: 'Schedule',

                iconData: Icons.access_time,
                onpressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                    return const ScheduleScreen();
                  },
                  ),
                  );
                },

            ),
            HomeScreenItems(
                title: 'Venues',
                iconData: Icons.location_on,
                onpressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                    return const VenueScreen();
                  },
                  ),
                  );
                }
            ),

            HomeScreenItems(
                title: 'History',
                iconData: Icons.history,
                onpressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                    return const HistoryScreen() ;
                  }));
                }

            ),

            HomeScreenItems(
                title: 'Teams',
                iconData: Icons.group,
                onpressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                    return const TeamsScreen() ;
                  }));
                }

            ),

            HomeScreenItems(
                title: 'Live Score',
                iconData: Icons.live_tv,
                onpressed: ()async{
                  var _url = 'https://www.t20worldcup.com/' ;
                  await canLaunchUrl(Uri.parse(_url))
                  ?
                  await launchUrl(Uri.parse(_url))
                      : throw "Could not found internet $_url" ;

                }

            ),

            HomeScreenItems(
                title: 'High lights',
                iconData: Icons.video_call,
                onpressed: ()async{
                  var _url = 'https://www.youtube.com/@ICC' ;
                  await canLaunchUrl(Uri.parse(_url))
                      ?
                  await launchUrl(Uri.parse(_url))
                      : throw "Could not found internet $_url" ;

                }

            ),

          ],
        ),
      ),
    );
  }
}


