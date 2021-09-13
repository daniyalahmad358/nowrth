import 'package:nowrth/screens/route/services/sides.dart';

import 'package:nowrth/models/spot_type.dart';

Side stopBySpotCardSideDecider(SpotType spotType) {
  if (spotType == SpotType.travelSpot) {
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
