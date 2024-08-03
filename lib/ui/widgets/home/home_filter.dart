import 'package:flutter/material.dart';

import '../../../core/theme/app_text_styles.dart';

class HomeFilter extends StatelessWidget {
  const HomeFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(
          'All Languages',
          style: AppTextStyles.font18DarkBold,
        ),
        const Spacer(),
        IconButton(
          icon:  const Icon(
            Icons.filter_list,
            size: 35,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
