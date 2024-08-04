import 'package:flutter/material.dart';

import 'package:vocabulary_note/ui/widgets/home/filter_dialog/filters_dialog.dart';
import 'package:vocabulary_note/ui/widgets/home/filter_text_widget.dart';

class HomeFilter extends StatelessWidget {
  const HomeFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const FilterTextWidget(),
        const Spacer(),
        Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.filter_list,
                size: 35,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const FiltersDialog(),
                );
              },
            );
          }
        ),
      ],
    );
  }
}

