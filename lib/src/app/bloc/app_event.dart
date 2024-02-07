part of 'app_bloc.dart';

sealed class AppEvent {
  const AppEvent();
}

final class _AppThemeChanged extends AppEvent {
  const _AppThemeChanged(this.theme);

  final ThemeMode theme;
}