part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class RegisterUser extends RegisterEvent{
  String email_id;
  String first_name;
  String last_name;
  String gender;
  DateTime date_of_birth;
  String phone_number;
  String role;
  String password;
  RegisterUser({required this.email_id,required this.first_name,required this.last_name,required this.gender,required this.date_of_birth,required this.password,required this.phone_number,required this.role});
}
