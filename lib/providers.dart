
import 'package:flutter/cupertino.dart';
import 'package:islamic_app/presentation/auth/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'data/datasource/locale/locale_data_source.dart';
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
        // ChangeNotifierProvider(create: (_) => getIt<StoreKeeperViewModel>()),
        // ChangeNotifierProvider(create: (_) => getIt<QualitySpecialistViewModel>()),
        // ChangeNotifierProvider(create: (_) => getIt<SiteSupervisorViewModel>()),
        // ChangeNotifierProvider(create: (_) => getIt<DeliveryViewModel>()),
        // ChangeNotifierProvider(create: (_) => getIt<SuperVisorViewModel>()),
        // ChangeNotifierProvider(create: (_) => getIt<DirectorViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<ProductProvider>()),

      ],
      child: child,
    );
  }
}
