import 'package:flutter/material.dart';
import 'package:aftermarket/homepage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:aftermarket/login.dart';

class AuthGates extends StatelessWidget {
  const AuthGates({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot){
        final session = Supabase.instance.client.auth.currentSession;
        if(session!=null){
          return const HomePage();
        }else{
          return const LoginPage();
        }
      }
    );
  }
}