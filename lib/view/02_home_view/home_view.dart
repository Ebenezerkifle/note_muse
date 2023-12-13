import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_muse/app/routes.gr.dart';
import 'package:note_muse/providers/editing.provider.dart';
import 'package:note_muse/view/02_home_view/widgets/header_widget.dart';
import 'package:note_muse/view/02_home_view/widgets/top_intro_widget.dart';
import 'package:note_muse/view/common/app_colors.dart';
import 'package:note_muse/view/widgets/custome_card_tile.dart';
import 'package:note_muse/view/widgets/custome_dialog_widget.dart';
import 'package:note_muse/view/widgets/custome_grid_builder.dart';
import 'package:note_muse/view/widgets/image_builder.dart';

@RoutePage()
class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var editNotifier = ref.watch(EditingProvider.provider.notifier);
    var editProvider = ref.watch(EditingProvider.provider);
    var notes = editProvider.noteList.values.toList();
    showDialog() {
      CustomDialog.show(
          context: context,
          widget: TextFieldDialogBuilder(
            controller: controller,
            onApproveText: 'Proceed',
            onCancelText: 'Cancel',
            onApprove: () {
              if (controller.text != '') {
                // save a workspace on database.
                editNotifier.creatWorkSpace(controller.text);
                Future.delayed(Duration.zero);
                context.popRoute();
                context.pushRoute(
                    EditWorkspaceRoute(note: editProvider.currentNote));
                controller.clear();
              }
            },
            onCancel: () => context.popRoute(),
          ));
    }

    return Scaffold(
      body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10, 10),
            child: Column(children: [
              TopIntroWidget(),
              const SizedBox(height: 20),
              const HeaderWidget(),
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: CustomeGridBuilder(
                    items: List.generate(
                      notes.length + 1,
                      (index) => index == 0
                          ? CustomeCardTile(
                              onTap: () => showDialog(),
                              title: 'Add new Workspace',
                              centerText: true,
                              imageWidget: SizedBox(
                                height: MediaQuery.of(context).size.width * .27,
                                width: MediaQuery.of(context).size.width * .45,
                                child: const Icon(
                                  FontAwesomeIcons.plus,
                                  size: 50,
                                  color: AppColors.primary,
                                ),
                              ),
                            )
                          : CustomeCardTile(
                              onTap: () => context.pushRoute(
                                  EditWorkspaceRoute(note: notes[index - 1])),
                              title: notes[index - 1].title,
                              imageWidget: ImageBuilder(
                                image: 'assets/images/place_holder.jpg',
                                height: MediaQuery.of(context).size.width * .27,
                                width: MediaQuery.of(context).size.width * .45,
                                fit: BoxFit.cover,
                              ),
                              subtitle: 'Thuesday, Dec 20, 2023',
                            ),
                    ),
                  ),
                ),
              ),
            ]),
          )),
    );
  }
}
