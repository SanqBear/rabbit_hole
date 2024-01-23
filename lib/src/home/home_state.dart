part of 'home_cubit.dart';

enum HomeTab { manga, webtoon }

final class HomeState extends Equatable {
  const HomeState({
    this.tab = HomeTab.manga,
  });

  final HomeTab tab;

  @override
  List<Object> get props => [tab];
}
