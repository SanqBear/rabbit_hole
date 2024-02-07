part of 'setting_cubit.dart';

final class SettingState extends Equatable {
  const SettingState({
    this.themeMode = ThemeMode.system,
  });

  final ThemeMode themeMode;

  @override
  List<Object?> get props => [themeMode];

  SettingState copyWith({
    ThemeMode? themeMode,
  }) {
    return SettingState(
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
