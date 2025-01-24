import 'package:flutter/material.dart';
import 'package:t20_word_cup/models/schedule_model.dart';
import 'package:t20_word_cup/utility/schedule_data_store.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text(
          'Schedule Screen',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder<List<ScheduleModel>>(
            future: ScheduleDataStore.getAllMatches(context),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              var lengthData = snapshot.data;
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: lengthData.length,
                    itemBuilder: (context, index) {
                      ScheduleModel myData = snapshot.data[index];

                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        height: 260,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.purple,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              myData.date,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        myData.flagOne,
                                        height: 80,
                                        width: 90,
                                        fit: BoxFit.cover,
                                      ),
                                      // const SizedBox(
                                       //   width: 7,
                                      // ),
                                      Text(
                                        myData.teamOne,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  // const SizedBox(
                                  //   width: 7,
                                  // ),
                                  const Text(
                                    "VS",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // const SizedBox(
                                  //   width: 10,
                                  // ),
                                  Row(
                                    children: [
                                      Text(
                                        myData.teamTwo,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      // const SizedBox(
                                      //   width: 7,
                                      // ),
                                      Image.asset(
                                        myData.flagTwo,
                                        height: 80,
                                        width: 80,
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8,),
                            Text(
                              myData.venue,
                              style:
                                  const TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            const SizedBox(height: 6,),

                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 60,
                                  width: 110,
                              
                                  decoration: const BoxDecoration(
                              
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                              
                                  ),
                                  child: Center(
                                    child: Text('Group ${myData.group}',
                                         style: const TextStyle(color: Colors.white, fontSize: 15),),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      );
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
