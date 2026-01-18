// import 'package:flutter/material.dart';
// import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';
// import 'package:hr_management/features/auth/presentation/on_boarding_feat/model/on_boarding.dart';
//
// class ListGenerateWidget extends StatelessWidget {
//   final int currentIndex;
//   final List<OnBoardingEntity> onBoardingitems;
//   const ListGenerateWidget({
//     super.key,
//     required this.currentIndex,
//     required this.onBoardingitems,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         ...List.generate(onBoardingitems.length, (index) {
//           return Container(
//             margin: EdgeInsetsDirectional.only(end: 2),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               color: currentIndex == index
//                   ? context.colors.purple500
//                   : context.colors.purple100,
//             ),
//             height: 4,
//             width: 20,
//           );
//         }),
//       ],
//     );
//   }
// }
