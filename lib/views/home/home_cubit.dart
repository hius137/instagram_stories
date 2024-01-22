import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_stories/views/home/home_navigator.dart';
import 'package:instagram_stories/views/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.navigator}) : super(const HomeState());
  final HomeNavigator navigator;
}
