import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_muse/models/note.dart';
import 'package:note_muse/providers/editing.provider.dart';
import 'package:note_muse/view/common/app_colors.dart';
import 'package:note_muse/view/widgets/custome_app_bar.dart';

@RoutePage()
class EditWorkspaceView extends ConsumerStatefulWidget {
  const EditWorkspaceView({super.key, required this.note});

  final Note note;

  @override
  ConsumerState<EditWorkspaceView> createState() => _EditWorkspaceViewState();
}

class _EditWorkspaceViewState extends ConsumerState<EditWorkspaceView> {
  final QuillController _controller = QuillController.basic();

  @override
  void initState() {
     initial();
    super.initState();
  }
  initial(){
     var myContent = jsonDecode(widget.note.content);
    myContent.isNotEmpty
        ? _controller.document = Document.fromJson(myContent)
        : null;
  }


  @override
  Widget build(BuildContext context) {
    var editNotifier = ref.watch(EditingProvider.provider.notifier);

    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            CustomeAppBar(
              title: widget.note.title,
              height: MediaQuery.of(context).size.height * .07,
              actions: [
                IconButton(
                    onPressed: () {
                      editNotifier.updateNote(widget.note, _controller);
                      context.popRoute();
                    },
                    icon: const Icon(
                      FontAwesomeIcons.floppyDisk,
                      color: AppColors.light,
                    ))
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: QuillEditor.basic(
                  configurations: QuillEditorConfigurations(
                    controller: _controller,
                    readOnly: false,
                    sharedConfigurations: const QuillSharedConfigurations(
                      locale: Locale('en'),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: QuillToolbar.simple(
        configurations: QuillSimpleToolbarConfigurations(
          controller: _controller,
          sharedConfigurations: const QuillSharedConfigurations(
            locale: Locale('en'),
          ),
        ),
      ),
    );
  }
}
