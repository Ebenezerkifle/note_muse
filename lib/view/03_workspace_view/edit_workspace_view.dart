import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_muse/models/note.dart';
import 'package:note_muse/providers/editing.provider.dart';
import 'package:note_muse/view/03_workspace_view/widgets/action_buttons.dart';
import 'package:note_muse/view/03_workspace_view/widgets/note_builder.dart';
import 'package:note_muse/view/widgets/custome_app_bar.dart';

@RoutePage()
class EditWorkspaceView extends ConsumerStatefulWidget {
  const EditWorkspaceView({super.key, required this.title});

  final String title;

  @override
  ConsumerState<EditWorkspaceView> createState() => _EditWorkspaceViewState();
}

class _EditWorkspaceViewState extends ConsumerState<EditWorkspaceView> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var editProvider = ref.watch(EditingProvider.provider);
    var editNotifier = ref.watch(EditingProvider.provider.notifier);
    onSubmit(String data) {
      if (data.trim().isNotEmpty && data != '') {
        editNotifier.addNote(Note(
          data: data,
          type: 'type',
          createdTime: DateTime.now(),
          updatedTime: DateTime.now(),
        ));
        controller.clear();
        setState(() {});
      }
    }

    onChange(String data) {
      if (data.trim().isNotEmpty && data != '') {
        editNotifier.addNote(Note(
          data: data,
          type: 'type',
          createdTime: DateTime.now(),
          updatedTime: DateTime.now(),
        ));
      }
    }

    return Scaffold(
      body: SafeArea(
          top: true,
          child: Column(children: [
            CustomeAppBar(
              title: widget.title,
              height: MediaQuery.of(context).size.height * .07,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 10, 10.0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: editProvider.noteList.entries
                            .map((e) => NoteBuilder(
                                  note: e.value,
                                  onSubmit: (data) => onSubmit(data),
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ])),
      bottomNavigationBar: const ActionButtons(),
    );
  }
}
