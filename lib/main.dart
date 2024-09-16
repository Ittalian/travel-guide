import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/config/routes.dart';
import 'package:travel_guide/repositories/guide_list_item_repository.dart';
import 'package:travel_guide/repositories/guide_list_repository.dart';
import 'package:travel_guide/repositories/guide_repository.dart';
import 'package:travel_guide/repositories/guide_schedule_list_repository.dart';
import 'package:travel_guide/repositories/guide_schedule_repository.dart';
import 'package:travel_guide/serivces/guide_list_item_service.dart';
import 'package:travel_guide/serivces/guide_list_service.dart';
import 'package:travel_guide/serivces/guide_schedule_list_service.dart';
import 'package:travel_guide/serivces/guide_schedule_service.dart';
import 'package:travel_guide/serivces/guide_service.dart';
import 'package:travel_guide/view_models/guide_list_item_view_model.dart';
import 'package:travel_guide/view_models/guide_list_view_model.dart';
import 'package:travel_guide/view_models/guide_schedule_list_view_model.dart';
import 'package:travel_guide/view_models/guide_schedule_view_model.dart';
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
        ChangeNotifierProvider(
            create: (_) => GuideScheduleViewModel(
                GuideScheduleRepository(GuideScheduleService()))),
        ChangeNotifierProvider(
            create: (_) => GuideScheduleListViewModel(
                GuideScheduleListRepository(GuideScheduleListService()))),
        ChangeNotifierProvider(
            create: (_) =>
                GuideListViewModel(GuideListRepository(GuideListService()))),
        ChangeNotifierProvider(
            create: (_) => GuideListItemViewModel(
                GuideListItemRepository(GuideListItemService()))),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.home,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
