part of 'pagination_bloc_bloc.dart';

@immutable
sealed class PaginationBlocEvent {}

class AddNumbers extends PaginationBlocEvent{}

class AddNewNumbers extends PaginationBlocEvent{}
