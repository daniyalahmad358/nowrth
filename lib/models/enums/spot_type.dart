enum SpotType {
  travelSpot,
  hotel,
  restaurant,
  fuelStation,
  bank,
}

extension SpotTypeValue on SpotType {
  String get value {
    switch (this) {
      case SpotType.travelSpot:
        return 'Picnic Spot';
      case SpotType.hotel:
        return 'Hotel';
      case SpotType.restaurant:
        return 'Restaurant';
      case SpotType.fuelStation:
        return 'Fuel Station';
      case SpotType.bank:
        return 'Bank';
    }
  }
}

List<String> get spotTypeValues {
  return <String>[
    SpotType.travelSpot.value,
    SpotType.hotel.value,
    SpotType.restaurant.value,
    SpotType.fuelStation.value,
    SpotType.bank.value,
  ];
}
