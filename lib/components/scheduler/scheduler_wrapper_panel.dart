// import 'package:driving_school_app/providers/scroll_events_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../constants/colors.dart';
// import '../../models/instructor.dart';
// import '../../models/scheduler_dimensions.dart';
// import 'footer.dart';
// import 'main_panel.dart';
// import 'avatar_wrapper.dart';
// import 'right_scroll_bar.dart';
// import 'header.dart';

// class SchedulerWrapperPanel extends StatelessWidget {
//   final List<Instructor> _instructors;

//   const SchedulerWrapperPanel(this._instructors);

//   double fullSwimlaneHeight(BuildContext context) {
//     var schedulerDimensions = SchedulerDimensions.of(context);
//     return _instructors.length * schedulerDimensions.blockSize.height +
//         (schedulerDimensions.cardSeparatorHeight * (_instructors.length + 1));
//   }

//   @override
//   Widget build(BuildContext context) {
//     var schedulerDimensions = SchedulerDimensions.of(context);
//     var swimlaneHeight = fullSwimlaneHeight(context);

//     return Provider(
//       create: (context) => ScrollEventsProvider(),
//       child: Container(
//         width: schedulerDimensions.innerWidth,
//         height: schedulerDimensions.innerHeight,
//         decoration: BoxDecoration(
//           color: AppColors.GreyLight,
//           // borderRadius: BorderRadius.all(Radius.circular(20.0)),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Header(),
//             SizedBox(
//               child: Row(
//                 children: [
//                   LeftAvatarWrapper(),
//                   MainPanel(
//                     blockHeight: schedulerDimensions.blockSize.height,
//                   ),
//                   RightScrollBar(),
//                 ],
//               ),
//               height: schedulerDimensions.preferredInnerHeight,
//             ),
//             Footer()
//           ],
//         ),
//       ),
//     );
//   }
// }
