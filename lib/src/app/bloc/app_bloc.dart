import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:setting_repository/setting_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required SettingRepository settingRepository})
      : _settingRepository = settingRepository,
        super(AppState._(theme: settingRepository.currentThemeMode)) {
    on<_AppThemeChanged>(_onThemeChanged);
    _themeSubscription = settingRepository.themeMode.listen(
      (theme) => add(_AppThemeChanged(theme)),
    );
  }

  final SettingRepository _settingRepository;
  late final StreamSubscription<ThemeMode> _themeSubscription;

  void _onThemeChanged(_AppThemeChanged event, Emitter<AppState> emit) {
    if (event.theme == state.theme) return;
    unawaited(_settingRepository.updateThemeMode(event.theme));
    emit(AppState._(theme: event.theme));
  }

  @override
  Future<void> close() {
    _themeSubscription.cancel();
    return super.close();
  }
}
