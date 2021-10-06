import 'package:flutter/widgets.dart';
import 'package:nowrth/models/classes/spot.dart';

import 'package:nowrth/temp/spot/spot.dart';

List<UniqueKey> likedSpotIds = [
  allSpots[0].spotID,
  allSpots[1].spotID,
  allSpots[2].spotID,
];
List<UniqueKey> contributedSpotIds = [
  allSpots[0].spotID,
  allSpots[1].spotID,
  allSpots[2].spotID,
];

List<Spot> likedSpots =
    allSpots.where((element) => likedSpotIds.contains(element.spotID)).toList();

// List<Contribution> contributions = [
//   Contribution(
//     contributionId: 1,
//     spotName: 'Some Where',
//     spotType: 'Hotel',
//     spotLocation: const SpotLocation(latitude: 'xd', longitude: 'xd'),
//     images: [Image.asset('assets/images/spot_images/0.jpg')],
//     status: ContributionStatus.ok,
//   ),
//   Contribution(
//     contributionId: 1,
//     spotName: 'Some Where',
//     spotType: 'Hotel',
//     spotLocation: const SpotLocation(latitude: 'xd', longitude: 'xd'),
//     images: [Image.asset('assets/images/spot_images/1.jpg')],
//     status: ContributionStatus.ok,
//   ),
//   Contribution(
//     contributionId: 1,
//     spotName: 'Some Where',
//     spotType: 'Hotel',
//     spotLocation: const SpotLocation(latitude: 'xd', longitude: 'xd'),
//     images: [Image.asset('assets/images/spot_images/2.jpg')],
//     status: ContributionStatus.ok,
//   ),
//   Contribution(
//     contributionId: 1,
//     spotName: 'Some Where',
//     spotType: 'Hotel',
//     spotLocation: const SpotLocation(latitude: 'xd', longitude: 'xd'),
//     images: [Image.asset('assets/images/spot_images/3.jpg')],
//     status: ContributionStatus.ok,
//   ),
//   Contribution(
//     contributionId: 1,
//     spotName: 'Some Where',
//     spotType: 'Hotel',
//     spotLocation: const SpotLocation(latitude: 'xd', longitude: 'xd'),
//     images: [Image.asset('assets/images/spot_images/4.jpg')],
//     status: ContributionStatus.ok,
//   ),
//   Contribution(
//     contributionId: 1,
//     spotName: 'Some Where',
//     spotType: 'Hotel',
//     spotLocation: const SpotLocation(latitude: 'xd', longitude: 'xd'),
//     images: [Image.asset('assets/images/spot_images/5.jpg')],
//     status: ContributionStatus.ok,
//   ),
//   Contribution(
//     contributionId: 1,
//     spotName: 'Some Where',
//     spotType: 'Hotel',
//     spotLocation: const SpotLocation(latitude: 'xd', longitude: 'xd'),
//     images: [Image.asset('assets/images/spot_images/6.jpg')],
//     status: ContributionStatus.ok,
//   ),
//   Contribution(
//     contributionId: 1,
//     spotName: 'Some Where',
//     spotType: 'Hotel',
//     spotLocation: const SpotLocation(latitude: 'xd', longitude: 'xd'),
//     images: [Image.asset('assets/images/spot_images/7.jpg')],
//     status: ContributionStatus.ok,
//   ),
//   Contribution(
//     contributionId: 1,
//     spotName: 'Some Where',
//     spotType: 'Hotel',
//     spotLocation: const SpotLocation(latitude: 'xd', longitude: 'xd'),
//     images: [Image.asset('assets/images/spot_images/8.jpg')],
//     status: ContributionStatus.ok,
//   ),
//   Contribution(
//     contributionId: 1,
//     spotName: 'Some Where',
//     spotType: 'Hotel',
//     spotLocation: const SpotLocation(latitude: 'xd', longitude: 'xd'),
//     images: [Image.asset('assets/images/spot_images/9.jpg')],
//     status: ContributionStatus.ok,
//   ),
//   Contribution(
//     contributionId: 1,
//     spotName: 'Some Where',
//     spotType: 'Hotel',
//     spotLocation: const SpotLocation(latitude: 'xd', longitude: 'xd'),
//     images: [Image.asset('assets/images/spot_images/10.jpg')],
//     status: ContributionStatus.ok,
//   ),
//   Contribution(
//     contributionId: 1,
//     spotName: 'Shimali Waziristan',
//     spotType: 'Hotel',
//     spotLocation: const SpotLocation(latitude: 'xd', longitude: 'xd'),
//     images: [Image.asset('assets/images/spot_images/11.jpg')],
//     status: ContributionStatus.ok,
//   ),
// ];

// List<Spot> contributedSpots = allSpots
    // .where((element) => contributedSpotIds.contains(element.spotID))
    // .toList();
