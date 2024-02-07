part of 'app_bloc.dart';

final class AppState extends Equatable {
  const AppState._({required this.theme});

  final ThemeMode theme;

  @override
  List<Object> get props => [theme];
}
