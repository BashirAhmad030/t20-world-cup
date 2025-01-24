


import 'package:flutter/material.dart';
import 'package:t20_word_cup/models/history_model.dart';
import 'package:t20_word_cup/utility/history_dataStore.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text(
          'History',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),

      ),
      body: FutureBuilder<List<HistoryModel>>(
        future: HistoryDataStor.getAllHistory(context),
        builder: (context, snapshot){
          var listData = snapshot.data ;
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: listData!.length,
                itemBuilder: (context, index){
                var myData = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [


                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Text("Hosted by : ${myData.host}", style: const TextStyle(color: Colors.white, fontSize: 20),),

                              // const SizedBox(width: 8),
                              Text(myData.year, style: const TextStyle(color: Colors.white, fontSize: 20),),

                              ],
                           ),
                          const SizedBox(height: 8,),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Winner', style: TextStyle(color: Colors.white, fontSize: 20), ),
                              Text('Runner', style: TextStyle(color: Colors.white, fontSize: 20), ),
                            ],
                          ),
                          const SizedBox(height: 15,),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(myData.winnerFlag,
                                  height: 60,
                                  width: 62,
                                  fit: BoxFit.cover,
                                  
                                ),
                            
                                Text(myData.winner, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
                            
                            
                                const Text('VS', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                            
                                Text(myData.runnerUp, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
                            
                            
                                Image.asset(myData.runnerFlag,
                                  height: 60,
                                  width: 62,
                                  fit: BoxFit.cover,
                            
                                ),
                            
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //   children: [
                                //
                                //
                                //   ],
                                // )
                            
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
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

      ),
    );
  }
}
