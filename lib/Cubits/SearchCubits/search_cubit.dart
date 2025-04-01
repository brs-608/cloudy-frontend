import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:cloudy/Utils/TokenUtil.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  Timer? _debounce;

  void searchHistory(String query)async{
    if(query.isEmpty){
      emit(SearchInitial());
      return;
    }
    if(_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: 800), ()async{
      emit(SearchLoading());
      String? token = await TokenUtil.getToken();
      try{
        final response = await http.get(
          Uri.parse("http://192.168.0.105:8080/users/search-users?query=$query"),
          headers: {
            'Authorization': 'Bearer $token',
          }

        );
        if(response.statusCode == 200){
          List<dynamic> users = jsonDecode(response.body);
            emit(SearchLoaded(users: users.cast<Map<String,dynamic>>()));
        }else{
          print("search error");
          emit(SearchError());

        }
      }catch(e){
        emit(SearchError());
      }
    }
    );
  }

  @override
  Future<void> close() {
      _debounce?.cancel();
      return super.close();
  }
}
