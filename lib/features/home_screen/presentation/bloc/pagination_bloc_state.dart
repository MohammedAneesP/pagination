part of 'pagination_bloc_bloc.dart';

@immutable
sealed class PaginationBlocState {}

final class PaginationBlocInitial extends PaginationBlocState {}

class FirstList extends PaginationBlocState {
  final List<dynamic> anlist;
  FirstList({required this.anlist});
}

class LoadingState extends PaginationBlocState{}


