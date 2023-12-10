import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:note_muse/view/03_workspace_view/widgets/action_buttons.dart';
import 'package:note_muse/view/widgets/custome_app_bar.dart';

@RoutePage()
class EditWorkspaceView extends StatelessWidget {
  const EditWorkspaceView({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: true,
          child: Column(children: [
            CustomeAppBar(title: title, height: MediaQuery.of(context).size.height*.07,),
          ])),
    bottomNavigationBar: const ActionButtons(),
    );
  }
}
