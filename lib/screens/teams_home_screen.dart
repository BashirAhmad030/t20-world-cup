import 'package:flutter/material.dart';

import 'package:t20_word_cup/models/teams_model.dart';
import 'package:t20_word_cup/utility/teams_data_store.dart';

class TeamsScreen extends StatelessWidget {
  const TeamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: const Text('Teams', style: TextStyle(color: Colors.white, fontSize: 25),),
      ),
      body: FutureBuilder<List<TeamsModel>>(
        future: TeamsDataStore.getAllTeams(context),
        builder:(BuildContext context, AsyncSnapshot snapshot){
          var listData = snapshot.data ;
          if(snapshot.hasData) {

            return ListView.builder(
              itemCount: listData!.length,
                itemBuilder: (context, index){
                TeamsModel myData = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 210,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(myData.flag,
                              height: 100, width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(myData.fullName, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                          Text(myData.shortName, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),)
                        ],
                      ),
                    )
                  ),
                );

                }
            );

          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }

      ),
    );
  }
}
