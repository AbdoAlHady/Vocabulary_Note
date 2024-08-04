import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabulary_note/core/di/depndancy_injection.dart';
import 'package:vocabulary_note/core/routing/app_router.dart';
import 'package:vocabulary_note/core/routing/routes.dart';
import 'package:vocabulary_note/core/theme/app_theme.dart';
import 'package:vocabulary_note/logic/read_note_cubit/read_note_cubit.dart';

class VocabularyNoteApp extends StatelessWidget {
  const VocabularyNoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => ReadNoteCubit(getIt())..getNotesFromDatabase(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter().onGenerateRoute,
            initialRoute: Routes.splashScreen,
            theme: AppTheme.darkTheme,
          ),
        );
      },
    );
  }
}
