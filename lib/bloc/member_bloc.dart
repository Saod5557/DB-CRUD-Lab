import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase1/model/members_model.dart';
import 'package:supabase1/data/data+injection.dart';
import 'package:supabase1/data/supabase.dart';

part 'member_event.dart';
part 'member_state.dart';

class MemberBloc extends Bloc<MemberEvent, MemberState> {
  MemberBloc() : super(MemberInitial()) {
    on<MemberEvent>((event, emit) {
      // TODO: implement event handler
      
    });
    on<FetchDataEvent>((event, emit) async{
      final servel = DataInjection().locator.get<DBService>();
      try {
        List<Member> memberList = await servel.fetchMembers();
        emit(DisplayInfoState(classMember: memberList));
      } catch (e) {
        print(e);
        emit(ErrorState());
      }
     
    },);
  on<CreateInfoEvent>((event, emit) async{
      final servel = DataInjection().locator.get<DBService>();
      try {
         await servel.createData(event.name,event.gender);
        List<Member> memberList = await servel.fetchMembers();
        emit(DisplayInfoState(classMember: memberList));
      } catch (e) {
        print(e);
        emit(ErrorState());
      }
     
    },);
   on<UpdateEvent>((event, emit) async{
      final servel = DataInjection().locator.get<DBService>();
      try {
         await servel.updateData(event.name,event.gender,event.id);
        List<Member> memberList = await servel.fetchMembers();
        emit(DisplayInfoState(classMember: memberList));
      } catch (e) {
        print(e);
        emit(ErrorState());
      }
     
    },);

on<DeleteEvent>((event, emit) async{
      final servel = DataInjection().locator.get<DBService>();
      try {
         await servel.deletedData(event.id);
        List<Member> memberList = await servel.fetchMembers();
        emit(DisplayInfoState(classMember: memberList));
      } catch (e) {
        print(e);
        emit(ErrorState());
      }
     
    },);

    
  }
}
