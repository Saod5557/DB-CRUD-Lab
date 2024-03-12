import 'package:supabase1/model/members_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DBService{
// Get a reference your Supabase client
final supabase = Supabase.instance.client;



Future fetchMembers()async{
  final membersData = await supabase.from('members').select('*');
  print("Finish");
  List<Member> classMember=[];
  //Add members 
  for (var elment in membersData){
    classMember.add(Member.fromJson(elment));
  }
  return classMember;
}

 Future createData (String name,String gender)async{
  await supabase.from('members').insert({"name":name,"gender":gender});
 
}

Future updateData (String name,String gender,int id)async{
  await supabase.from('members').update({"name":name,"gender":gender}).match({'id':id});
  
}





Future deletedData (int id)async{
  await supabase.from('members').delete().match({"id":id});
 
}



}
