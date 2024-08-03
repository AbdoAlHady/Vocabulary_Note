import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary_note/core/enums/enums.dart';
import 'package:vocabulary_note/core/theme/app_colors.dart';
import 'package:vocabulary_note/core/utis/extensions.dart';
import 'package:vocabulary_note/logic/write_note_cubit/write_note_cubit.dart';

class NoteTextField extends StatefulWidget {
  const NoteTextField({super.key, required this.label, required this.formKey});
  final String label;
  final GlobalKey<FormState> formKey;

  @override
  State<NoteTextField> createState() => _NoteTextFieldState();
}

class _NoteTextFieldState extends State<NoteTextField> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: TextFormField(
        controller: controller,
        autofocus: true,
        maxLines: 2,
        minLines: 1,
        onChanged: (value) {
          context.read<WriteNoteCubit>().updateText(value);
        },
        validator: (value) {
          return _validator(value, context.read<WriteNoteCubit>().isArabic);
        },
        decoration: InputDecoration(
            labelText: widget.label,
            labelStyle: TextStyle(
              color: context.isDark() ? AppColors.white : AppColors.dark,
            ),
            border: _buildTextFormBorder(context),
            focusedBorder: _buildTextFormBorder(context),
            enabledBorder: _buildTextFormBorder(context),
            errorBorder: _buildErrorBorder()),
      ),
    );
  }

  String? _validator(String? value, bool isArabic) {
    if (value == null || value.isEmpty) {
      return 'This Field Has not to be empty';
    }
    for (var i = 0; i < value.length; i++) {
      CharacterType characterType = _getCharacterType(value.codeUnitAt(i));
      if (characterType == CharacterType.notValid) {
        return 'Character Number ${i + 1} not valid';
      } else if (characterType == CharacterType.arabic && !isArabic) {
        return 'Character Number ${i + 1} is not english character';
      } else if (characterType == CharacterType.english && isArabic) {
        return 'Character Number ${i + 1} is not arabic character';
      }
    }
    return null;
  }

  CharacterType _getCharacterType(int asciCode) {
    if (asciCode >= 65 && asciCode <= 90 || asciCode >= 97 && asciCode <= 122) {
      return CharacterType.english;
    } else if (asciCode == 32) {
      return CharacterType.space;
    } else if (asciCode >= 1569 && asciCode <= 1610) {
      return CharacterType.arabic;
    } else {
      return CharacterType.notValid;
    }
  }

  OutlineInputBorder _buildErrorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: Colors.redAccent,
      ),
    );
  }

  OutlineInputBorder _buildTextFormBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: context.isDark() ? AppColors.white : AppColors.dark,
      ),
    );
  }
}
