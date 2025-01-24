import 'package:flutter/material.dart';
import 'package:t20_word_cup/models/venue_model.dart';
import 'package:t20_word_cup/utility/VenueDataStore.dart';


class VenueScreen extends StatelessWidget {
  const VenueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text(
          'Venues Data',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),

      ),
      body: FutureBuilder<List<VenueModel>>(
        future: VenuesDataStore.getAllVenues(context),
        builder: (context, snapshot){
          var listData = snapshot.data ;
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: listData!.length,
                itemBuilder: (context, index){
                var myData = snapshot.data! [index];
                return Container(
                  height: 290,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Text('Country: ${myData.country}', style: TextStyle(fontSize: 20),
                      ),
                      Text('City: ${myData.city}',style: TextStyle(fontSize: 20), ),
                      Text(myData.stadium, style: TextStyle(fontSize: 16),),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          myData.image,
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                );
              }
            );

          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

        },

      )
    );
  }
}
