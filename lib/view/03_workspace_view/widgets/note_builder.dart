import 'package:flutter/material.dart';
import 'package:note_muse/models/note.dart';
import 'package:note_muse/view/common/app_colors.dart';
import 'package:note_muse/view/widgets/input_field.dart';

class NoteBuilder extends StatefulWidget {
  const NoteBuilder({
    super.key,
    required this.note,
    this.edit = true,
    this.onSubmit,
  });
  final Note note;
  final bool edit;
  final Function(dynamic)? onSubmit;

  @override
  State<NoteBuilder> createState() => _NoteBuilderState();
}

class _NoteBuilderState extends State<NoteBuilder> {
  TextEditingController controller = TextEditingController();
  var edit = true;
  var data = '';
  @override
  void initState() {
    super.initState();
    edit = widget.edit;
  }

  // onTap() {
  //   edit = !edit;
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        //onTap: onTap,
        child: Row(
      children: [
        //const Icon(FontAwesomeIcons.circleDot),
        Container(
          height: 10,
          width: 10,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: MediaQuery.of(context).size.width * .8,
          child: InputField(
            controller: controller,
            stroke: false,
            onSubmit: widget.onSubmit,
            inputType: TextInputType.multiline,
          ),
        ),
      ],
    )
        // : AutoSizeText(s
        //     widget.note.data,
        //     textAlign: TextAlign.start,
        //     style: AppTextStyle.h4Normal,
        //   ),
        );
  }
}
