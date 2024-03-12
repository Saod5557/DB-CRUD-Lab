
import 'package:get_it/get_it.dart';
import 'package:supabase1/data/supabase.dart';

class DataInjection{
  final locator = GetIt.I;

  void setup(){
    locator.registerSingleton<DBService>(DBService());
  }

}