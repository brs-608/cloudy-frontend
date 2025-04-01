part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

class SearchLoading extends SearchState{}

class SearchLoaded extends SearchState{
    List<Map<String,dynamic>> users;
    SearchLoaded({required this.users});
}
class SearchError extends SearchState{}