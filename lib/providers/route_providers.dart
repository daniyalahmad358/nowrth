import 'package:nowrth/models/classes/spot.dart';
import 'package:nowrth/models/classes/contribution.dart';

abstract class SelectedSpotProvider {
  static Spot? _selectedSpot;

  static set selectedSpot(Spot _selectedSpot_) {
    _selectedSpot = _selectedSpot_;
  }

  static Spot get getSelectedSpot {
    return _selectedSpot!;
  }
}

abstract class AllContributionsLIProvider {
  static List<ContributionListItem>? _allContributionsLi;

  static set allContributionsLi(
    List<ContributionListItem> _allContributionsLi_,
  ) {
    _allContributionsLi = _allContributionsLi_;
  }

  static List<ContributionListItem> get getAllContributionsLi {
    return _allContributionsLi!;
  }
}

abstract class ContributionToEditIdProvider {
  static int? _contributionToEditId;

  static set contributionToEditId(
    int _contributionToEditId_,
  ) {
    contributionToEditId = _contributionToEditId_;
  }

  static int? get getContributionToEditId {
    return _contributionToEditId!;
  }
}

abstract class ContributionsPageRefresherProvider {
  static void Function()? _contributionsPageRefresher;

  static set contributionsPageRefresher(
    void Function() _contributionsPageRefresher_,
  ) {
    _contributionsPageRefresher = _contributionsPageRefresher_;
  }

  static void Function() get getContributionsPageRefresher {
    return _contributionsPageRefresher!;
  }
}
