import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase1/data/data+injection.dart';
import 'package:supabase1/page/my_home.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'bloc/member_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env["urlSupabase"]!,
    anonKey: dotenv.env["aninoKeySup"]!,
  );
 DataInjection().setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MemberBloc()..add(FetchDataEvent()),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHome()),
    );
  }
}
