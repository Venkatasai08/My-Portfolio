import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/supabaseKeys.dart';
import 'package:portfolio/globals/utils.dart';
import 'package:portfolio/provider/contactUsProvider.dart';
import 'package:portfolio/provider/dashboardProvider.dart';
import 'package:portfolio/provider/myServicesProvider.dart';
import 'package:portfolio/provider/projectsProvider.dart';
import 'package:portfolio/provider/skillsProvider.dart';
import 'package:portfolio/loaderScreen.dart';
import 'package:portfolio/main_dashboard.dart';
import 'package:provider/provider.dart';

import 'testing/storageTestingScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const firebaseConfig = FirebaseOptions(
      apiKey: "AIzaSyB-Z91ggcEujqe5RQvGiPPgf421ScCni0g",
      authDomain: "mychat-bc5a1.firebaseapp.com",
      projectId: "mychat-bc5a1",
      storageBucket: "mychat-bc5a1.appspot.com",
      messagingSenderId: "750341393850",
      appId: "1:750341393850:web:a5f113b3ceb96900682183");
  await Firebase.initializeApp(options: firebaseConfig);
  // await dotenv.load(fileName: ".env");
  // final String? supabaseUrl = dotenv.env['SUPA_BASE_API_URL'];
  // final String? supabaseApiKey = dotenv.env['SUPA_BASE_API_KEY'];
  // const String supabaseUrl = SupabaseKeys.SUPA_BASE_API_URL;
  // const String supabaseApiKey = SupabaseKeys.SUPA_BASE_API_KEY;

  // // debugPrint("${supabaseUrl!} good job  $supabaseApiKey");

  // await Supabase.initialize(
  //   url: supabaseUrl,
  //   anonKey: supabaseApiKey,
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DashboardProvider>(
          create: (context) => DashboardProvider(),
        ),
        ChangeNotifierProvider<ServicesProvider>(
          create: (context) => ServicesProvider(),
        ),
        ChangeNotifierProvider<ProjectsProvider>(
          create: (context) => ProjectsProvider(),
        ),
        ChangeNotifierProvider<SkillProvider>(
          create: (context) => SkillProvider(),
        ),
        ChangeNotifierProvider<ContactUsProvider>(
          create: (context) => ContactUsProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Venkatasai Vishwanath',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          "loader": (context) => const LoaderScreen(),
          // "--": (context) => const StorageTestingScreen()
        },
        home: const LoaderScreen(),
      ),
    );
  }
}
