part of 'member_bloc.dart';

@immutable
sealed class MemberEvent {}

class FetchDataEvent extends MemberEvent{}

class CreateInfoEvent extends MemberEvent{
  final String name ;
  final String gender ;
  CreateInfoEvent({required this.name,required this.gender});
}
class UpdateEvent extends MemberEvent{
  final String name ;
  final String gender ;
  final int id;
    UpdateEvent({required this.name,required this.gender,required this.id});
}

class DeleteEvent extends MemberEvent{
  
  final int id;
    DeleteEvent({required this.id});
}