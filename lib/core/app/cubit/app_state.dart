part of 'app_cubit.dart';

sealed class AppState {}

final class AppInitial extends AppState {}

final class ChangeThemeSuccessState extends AppState {
  final bool isDarkMode;
  ChangeThemeSuccessState(this.isDarkMode);
}
