import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/anime_screen.dart';
import 'screens/manga_screen.dart';
import 'screens/login_screen.dart';
import 'screens/forgot_password_screen.dart';


final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => LoginScreen(),
  '/home': (context) => HomeScreen(),
  '/anime': (context) => AnimeScreen(),
  '/manga': (context) => MangaScreen(),
  '/forgot-password': (context) => ForgotPasswordScreen(),

};
