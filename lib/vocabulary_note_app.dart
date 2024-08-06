import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabulary_note/core/app/cubit/app_cubit.dart';
import 'package:vocabulary_note/core/di/depndancy_injection.dart';
import 'package:vocabulary_note/core/routing/app_router.dart';
import 'package:vocabulary_note/core/routing/routes.dart';
import 'package:vocabulary_note/core/theme/app_theme.dart';
import 'package:vocabulary_note/helpers/cache_helper.dart';
import 'package:vocabulary_note/logic/read_note_cubit/read_note_cubit.dart';
import 'package:vocabulary_note/logic/write_note_cubit/write_note_cubit.dart';

class VocabularyNoteApp extends StatelessWidget {
  const VocabularyNoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => WriteNoteCubit(getIt())),
            BlocProvider(
                create: (context) =>
                    ReadNoteCubit(getIt())..getNotesFromDatabase()),
            BlocProvider(
              create: (context) => AppCubit()
                ..changeAppThemeMode(
                    sharedMode: CacheHelper().getData(key: 'theme_mode')),
            )
          ],
          child: BlocBuilder<AppCubit, AppState>(
            buildWhen: (previous, current) =>  previous != current,
            builder: (context, state) {
               final cubit = context.read<AppCubit>();
              return MaterialApp(
                
                debugShowCheckedModeBanner: false,
                onGenerateRoute: AppRouter().onGenerateRoute,
                initialRoute: Routes.splashScreen,
                theme: cubit.isDark?AppTheme.darkTheme: AppTheme.lightTheme,
              );
            },
          ),
        );
      },
    );
  }
}
