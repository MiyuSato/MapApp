import 'models/spot.dart';

//TODO: BFSアルゴリズムに、スタートとゴールのSpotと制限時間を渡して、Spotのリストを受け取る
class BFS {
  Spot? startSpot;
  Spot? goalSpot;
  int? limitTime; //TODO: ?を取る

  BFS({this.startSpot, this.goalSpot, this.limitTime}); // あとで使う

  List<Spot> searchSpots() {
    List<Spot> resultSpots = [
      Spot(
          id: 1,
          lat: 34.9671899,
          long: 135.7732739,
          rating: 4.3,
          name: '伏見稲荷大社'),
      Spot(
          id: 2,
          lat: 35.0394501,
          long: 135.7292142,
          rating: 4.4,
          name: '鹿苑寺（金閣寺）'),
      Spot(id: 3, lat: 34.994862, long: 135.7849886, rating: 4.2, name: '清水寺'),
      Spot(
          id: 4,
          lat: 34.9807766,
          long: 135.7476312,
          rating: 4.0,
          name: '東寺（教王護国寺）'),
      Spot(
          id: 5,
          lat: 35.026892,
          long: 135.7981863,
          rating: 4.3,
          name: '銀閣寺（慈照寺）'),
    ];
    return resultSpots;
  }
}
