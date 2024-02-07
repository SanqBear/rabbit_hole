import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:setting_repository/setting_repository.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit(this._settingRepository) : super(const SettingState());

  final SettingRepository _settingRepository;

  Future<void> updateTheme(ThemeMode theme) async {
    await _settingRepository.updateThemeMode(theme);
    emit(state.copyWith(themeMode: theme));
  }
}
