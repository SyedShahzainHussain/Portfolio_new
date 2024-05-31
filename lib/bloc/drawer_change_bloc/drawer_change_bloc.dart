import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'drawer_change_event.dart';
part 'drawer_change_state.dart';

class DrawerChangeBloc extends Bloc<DrawerChangeEvent, DrawerChangeState> {
  DrawerChangeBloc() : super(const DrawerChangeState()) {
    on<ChangePageIndex>(_changePageIndex);
  }

  _changePageIndex(ChangePageIndex event, Emitter<DrawerChangeState> emit) {
    emit(state.copyWith(currentIndex: event.index));
  }
}
