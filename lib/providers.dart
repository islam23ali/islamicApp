
import 'package:flutter/cupertino.dart';
import 'package:islamic_app/presentation/auth/auth_view_model.dart';
import 'package:islamic_app/presentation/home_screen/home_view_model.dart';
import 'package:islamic_app/presentation/my_habits_screen/my_habits_screen_view_model.dart';
import 'package:islamic_app/presentation/register_screen/register_screen_view_model.dart';
import 'package:islamic_app/presentation/reports_screen/reports_screen_view_model.dart';
import 'package:islamic_app/presentation/tools_screen/pages/quraan/my_provider_quraan.dart';
import 'package:islamic_app/presentation/tools_screen/pages/rosary_page/rosary_view_model.dart';
import 'package:islamic_app/presentation/tools_screen/tools_view_model.dart';
import 'package:provider/provider.dart';
import 'injection.dart';

class GenerateMultiProvider extends StatelessWidget {
  final Widget child;

  const GenerateMultiProvider({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<AuthViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<ToolsViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<MyProviderQuraan>()),
        ChangeNotifierProvider(create: (_) => getIt<RegisterScreenViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<HabitsScreenViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<HomeViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<ReportsScreenViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<RosaryViewModel>()),

      ],
      child: child,
    );
  }
}
