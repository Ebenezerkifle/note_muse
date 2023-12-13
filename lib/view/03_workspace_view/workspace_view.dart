// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:note_muse/app/routes.gr.dart';
// import 'package:note_muse/models/note.dart';
// import 'package:note_muse/view/common/app_colors.dart';
// import 'package:note_muse/view/widgets/custome_app_bar.dart';
// import 'package:note_muse/view/widgets/icon_decore.dart';
// import 'package:note_muse/view/widgets/silver_presistent_widget.dart';

// @RoutePage()
// class WorkspaceView extends StatelessWidget {
//   const WorkspaceView({super.key, required this.note});
//   final Note note;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           top: true,
//           child: CustomScrollView(
//             slivers: [
//               SliverAppBar(
//                 backgroundColor: AppColors.primary,
//                 pinned: false,
//                 floating: true,
//                 elevation: 0,
//                 leading: IconDecore(
//                   onTap: () => context.popRoute(),
//                   icon: FontAwesomeIcons.angleLeft,
//                 ),
//                 actions: [
//                   IconDecore(
//                     onTap: () {},
//                     icon: FontAwesomeIcons.magnifyingGlass,
//                   ),
//                   IconDecore(
//                     onTap: () {},
//                     icon: FontAwesomeIcons.shareNodes,
//                   ),
//                 ],
//                 expandedHeight: MediaQuery.of(context).size.height * 0.4,
//                 collapsedHeight: MediaQuery.of(context).size.height * 0.1,
//                 flexibleSpace: FlexibleSpaceBar(
//                   background: Image.asset('assets/images/place_holder.jpg',
//                       fit: BoxFit.fitWidth),
//                 ),
//               ),
//               SliverPersistentHeader(
//                 pinned: true,
//                 floating: true,
//                 delegate: PersistentHeader(
//                     height: MediaQuery.of(context).size.height * 0.07,
//                     color: AppColors.secondary,
//                     context: context,
//                     widget:  CustomeAppBar(
//                       title: note.title,
//                       back: false,actions: [],
//                     )),
//               ),
//               SliverFillRemaining(
//                 //child: ,
//               )
//             ],
//           )),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => context.pushRoute(
//           EditWorkspaceRoute(note: note),
          
//         ),
//         child: const Icon(FontAwesomeIcons.penToSquare),
//         backgroundColor: AppColors.primary,
//       ),
//     );
//   }
// }
