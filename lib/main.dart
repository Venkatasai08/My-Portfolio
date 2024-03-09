import 'package:flutter/material.dart';
import 'package:portfolio/globals/utils.dart';
import 'package:portfolio/provider/contactUsProvider.dart';
import 'package:portfolio/provider/dashboardProvider.dart';
import 'package:portfolio/provider/myServicesProvider.dart';
import 'package:portfolio/provider/projectsProvider.dart';
import 'package:portfolio/provider/skillsProvider.dart';
import 'package:portfolio/responsiveViews/loaderScreen.dart';
import 'package:portfolio/main_dashboard.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load(fileName: ".env");
  // final String? supabaseUrl = dotenv.env['SUPA_BASE_API_URL'];
  // final String? supabaseApiKey = dotenv.env['SUPA_BASE_API_KEY'];
  const String supabaseUrl = Utils.SUPA_BASE_API_URL;
  const String supabaseApiKey = Utils.SUPA_BASE_API_KEY;

  // debugPrint("${supabaseUrl!} good job  $supabaseApiKey");

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseApiKey,
  );

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
        routes: {"loader": (context) => const LoaderScreen()},
        home: const MainDashBoard(),
      ),
    );
  }
}
