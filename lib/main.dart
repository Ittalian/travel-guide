import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/config/routes.dart';
import 'package:travel_guide/repositories/guide_repository.dart';
import 'package:travel_guide/serivces/guide_service.dart';
import 'package:travel_guide/view_models/guide_view_model.dart';
import 'config/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => GuideViewModel(GuideRepository(GuideService()))),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.home,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
