part of 'drawer_change_bloc.dart';

class DrawerChangeState extends Equatable {
  final int currentIndex;
  const DrawerChangeState({this.currentIndex = 0});

  DrawerChangeState copyWith({int? currentIndex}) {
    return DrawerChangeState(currentIndex: currentIndex ?? this.currentIndex);
  }

  @override
  List<Object> get props => [currentIndex];
}
