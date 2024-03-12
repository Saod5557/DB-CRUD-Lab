import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase1/bloc/member_bloc.dart';
import 'package:supabase1/model/members_model.dart';

import 'helper/colors.dart';

class cardWidget extends StatelessWidget {
  const cardWidget({super.key, required this.member});
final Member? member;
  @override
  Widget build(BuildContext context) {
    return  
      Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          
          
          height: 50,
          width: 230,
          decoration: BoxDecoration(
            color: dark,
            borderRadius: BorderRadius.circular(15)
            ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text("ID: ${member!.id.toString()}",style: TextStyle(color: white,fontWeight: FontWeight.bold)),
            ),
            const Spacer(),
            Text("Name:  ${member!.name}",style: TextStyle(color: white,fontWeight: FontWeight.bold)),
            const Spacer(),
            Text("Gender:  ${member!.gender}",style: TextStyle(color: white,fontWeight: FontWeight.bold)),
           IconButton(
  onPressed: () {
    TextEditingController nameController = TextEditingController(text: member!.name); 
  TextEditingController genderController = TextEditingController(text: member!.gender);
    showDialog(
      
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: brown1,
          title: Text('Edit Member'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: genderController,
                decoration: InputDecoration(labelText: 'Gender'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
               BlocProvider.of<MemberBloc>(context).add (
                              UpdateEvent(
                                name: nameController.text,
                                gender: genderController.text, id: member!.id,
                              ),
                            );
                            
                            BlocProvider.of<MemberBloc>(context).add (
                              FetchDataEvent(
                               
                              ),
                            );

                Navigator.pop(context); 
              },
              child: Text('Save',style: TextStyle(color: dark)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); 
              },
              child: Text('Cancel',style: TextStyle(color: dark)),
            ),
          ],
        );
      },
    );
  },
  
  icon: Icon(Icons.edit, color: Colors.grey),
),

            IconButton(onPressed: (){
               BlocProvider.of<MemberBloc>(context).add (
                              DeleteEvent(id: member!.id
                                
                              ),
                            );
                            
                            BlocProvider.of<MemberBloc>(context).add (
                              FetchDataEvent(
                               
                              ),
                            );

            }, icon: const Icon(Icons.delete,color: Colors.red,))
          
          ],),
        ),
      );
    
  }
}