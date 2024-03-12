part of 'member_bloc.dart';

@immutable
sealed class MemberState {}

final class MemberInitial extends MemberState {}

class DisplayInfoState extends MemberState{
  final List <Member> classMember;
  DisplayInfoState({required this.classMember});
}



class ErrorState extends MemberState {

}