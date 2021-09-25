// import 'package:flutter/material.dart';
// import 'package:nowrth/constants/app_colors.dart';
// import 'package:nowrth/models/classes/contribution.dart';
// import 'package:nowrth/models/enums/app_pages.dart';
// import 'package:nowrth/constants/size_config.dart';
// import 'package:nowrth/models/enums/contributed_spot_options.dart';
// import 'package:nowrth/screens/contribution/add_edit_spot/add_edit_contribution_screen.dart';

// class OptionsMenu extends StatelessWidget {
//   final Contribution contribution;
//   final Function() pageRefresher;

//   const OptionsMenu({
//     Key? key,
//     required this.contribution,
//     required this.pageRefresher,
//   }) : super(key: key);

//   static void showMenu(
//     BuildContext context, {
//     required Contribution contribution,
//     required Function() refresher,
//   }) {
//     showModalBottomSheet(
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             top: Radius.circular(20),
//           ),
//         ),
//         backgroundColor: kPrimaryLightColor,
//         context: context,
//         builder: (context) {
//           return OptionsMenu(
//             contribution: contribution,
//             pageRefresher: refresher,
//           );
//         });
//   }

//   void selectOption({
//     required BuildContext context,
//     required ContributionOptions selectedOption,
//   }) {
//     Navigator.pop(context);
//     if (selectedOption == ContributionOptions.edit) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => AddEditContributionScreen(
//               addEditPage: AppPage.editContribution,
//               contributionToEditId: contribution,
//               contributionsPageRefresher: pageRefresher),
//         ),
//       );
//     } else if (selectedOption == ContributionOptions.delete) {
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           buttonPadding: EdgeInsets.zero,
//           title: Text(
//             'Delete ${contribution.name}',
//             style: TextStyle(
//               fontSize: percentageHeight(2.4),
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           content: Text(
//             '$contribution will be deleted permanently',
//             style: TextStyle(
//               fontSize: percentageHeight(2.1),
//             ),
//           ),
//           actions: [
//             Row(
//               children: [
//                 Expanded(
//                   child: MaterialButton(
//                     padding: const EdgeInsets.symmetric(vertical: 15),
//                     child: const Text('Cancel'),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ),
//                 Container(
//                   width: 1,
//                   height: 30,
//                   color: kGreyColor,
//                 ),
//                 Expanded(
//                   child: MaterialButton(
//                     padding: const EdgeInsets.symmetric(vertical: 15),
//                     child: const Text('Confirm'),
//                     onPressed: () {
//                       Navigator.pop(context);
//                       // contributions.remove(contribution);
//                       pageRefresher();
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return SafeArea(
//       child: Wrap(
//         children: <Widget>[
//           const SizedBox(height: 10),
//           ListTile(
//             contentPadding:
//                 const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
//             leading: const Icon(Icons.edit),
//             title: const Text('Edit Spot'),
//             onTap: () => selectOption(
//               context: context,
//               selectedOption: ContributionOptions.edit,
//             ),
//           ),
//           const SizedBox(height: 10),
//           ListTile(
//             contentPadding:
//                 const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
//             leading: const Icon(Icons.delete),
//             title: const Text('Delete Spot'),
//             onTap: () => selectOption(
//               context: context,
//               selectedOption: ContributionOptions.delete,
//             ),
//           ),
//           const SizedBox(height: 10),
//           ListTile(
//             contentPadding:
//                 const EdgeInsets.symmetric(horizontal: 16, vertical: 2.5),
//             leading: const Icon(Icons.cancel),
//             title: const Text('Cancel'),
//             onTap: () => selectOption(
//               context: context,
//               selectedOption: ContributionOptions.cancel,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
