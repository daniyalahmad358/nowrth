String getSpotId(String? lastSpotId) {
  lastSpotId ??= "0";
  int lastSpotidInt = int.parse(lastSpotId);

  return (++lastSpotidInt).toString();
}

// class IdMaker {
//   static int spotId;

//   get getSpotId() {

//   }

// }
