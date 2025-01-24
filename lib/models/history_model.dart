
class HistoryModel{
  String winner ;
  String runnerUp ;
  String host ;
  String winnerFlag ;
  String runnerFlag ;
  String year;

  HistoryModel({
    required this.winner,
    required this.runnerUp,
    required this.host,
    required this.winnerFlag,
    required this.runnerFlag,
    required this.year ,
  });
  static HistoryModel fromJson(Map<String, dynamic>map){
    return HistoryModel(
        winner: map ['winner'],
        runnerUp: map ['runnerUp'],
        host: map ['host'],
        winnerFlag: map ['winnerFlag'],
        runnerFlag: map ['runnerFlag'],
        year: map ['year'] ,

    );

  }
}