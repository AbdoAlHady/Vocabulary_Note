import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helpers/cache_helper.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  bool isDark = true;

  // Theme Mode
  Future<void> changeAppThemeMode({bool? sharedMode}) async {
    if (sharedMode != null) {
      isDark = sharedMode;
      emit(ChangeThemeSuccessState(isDark));
    } else {
      isDark = !isDark;
      await CacheHelper()
          .saveData(key:'theme_mode', value: isDark);
      emit(ChangeThemeSuccessState(isDark));
    }
  }
}
