
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final int curlIndexDot;

  @override
  List<Object?> get props => [
    curlIndexDot,
  ];

  const HomeState({
    this.curlIndexDot = 0,
  });

  HomeState copyWith({
    int? curlIndexDot,
  }) {
    return HomeState(
      curlIndexDot: curlIndexDot ?? this.curlIndexDot,
    );
  }
}
