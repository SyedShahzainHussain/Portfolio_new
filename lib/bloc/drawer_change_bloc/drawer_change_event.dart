part of 'drawer_change_bloc.dart';

sealed class DrawerChangeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ChangePageIndex extends DrawerChangeEvent {
  final int index;
  ChangePageIndex({required this.index});
}
