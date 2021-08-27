import 'package:nowrth/models/stop_by_spot.dart';
import 'package:nowrth/screens/route/services/sides.dart';

Side stopBySpotCardSideDecider(StopBySpotType spotType) {
  if (spotType == StopBySpotType.travelSpot) {
    return Side.right;
  }
  return Side.left;
}

Side spotButtonSideDecider(Side stopBySpotCardSide) {
  if (stopBySpotCardSide == Side.left) {
    return Side.right;
  }
  return Side.left;
}
