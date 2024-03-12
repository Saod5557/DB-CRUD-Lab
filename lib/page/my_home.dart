import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase1/widget.dart';

import '../bloc/member_bloc.dart';
import '../helper/colors.dart';

class MyHome extends StatelessWidget {
   MyHome({super.key});
TextEditingController nameController = TextEditingController(); 
  TextEditingController genderController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: brown1,
      appBar: AppBar(
      backgroundColor: dark,
        title: Center(child: Text("Members",style: TextStyle(color: white,fontWeight: FontWeight.bold),)),),
        body: Column(
          children: [
            BlocBuilder<MemberBloc, MemberState>(
                  builder: (context, state) {
            if (state is DisplayInfoState){
               return ListView.builder(
                shrinkWrap: true,
              itemCount:state.classMember.length ,
              itemBuilder: (context, index) {
                return cardWidget(member: state.classMember[index]);
              },
            );
            }
            else{
              return Center(child: const Text("Error"));
            }
                   
                  },
                ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show a bottom sheet to add a new product
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 400,
                color: white,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // Text fields for entering product details
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: TextField(
                            controller: nameController,
                            decoration: const InputDecoration(
                              labelText: 'Name',
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: TextField(
                            controller: genderController,
                            decoration: const InputDecoration(
                              labelText: 'Gender',
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      
                     
                      // Button to create a new product
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: lightWhite,
                          backgroundColor: dark,
                        ),
                        child: const Text('Add'),
                         onPressed: () {
                            // Dispatch an event to add the new member
                            BlocProvider.of<MemberBloc>(context).add (
                              CreateInfoEvent(
                                name: nameController.text,
                                gender: genderController.text,
                              ),
                            );
                            
                            BlocProvider.of<MemberBloc>(context).add (
                              FetchDataEvent(
                               
                              ),
                            );

                          Navigator.pop(context); // Close the bottom sheet
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: dark,
        child: const Icon(
          Icons.add,
          color: white,
        ),
      ),
        
        
        );
  }
}
