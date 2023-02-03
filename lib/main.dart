import 'package:erb_system/controller/Orders/orders_controller.dart';
import 'package:erb_system/controller/category/category_controller.dart';
import 'package:erb_system/controller/controller.dart';
import 'package:erb_system/controller/hr_controller/hr_controller.dart';
import 'package:erb_system/controller/manufacturing/manufacturing_controller.dart';
import 'package:erb_system/controller/purchase_controller/pruchase_controller.dart';
import 'package:erb_system/controller/sestem_admin_controller/system_controller.dart';
import 'package:erb_system/controller/store_controller/add_store_controller.dart';
import 'package:erb_system/controller/suppliers/add_suppliers.dart';
import 'package:erb_system/controller/treasury/treasury_controller.dart';
import 'package:erb_system/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Controller()),
        ChangeNotifierProvider(
            create: (context) => AddStoreController()..getStoreDetails()),
        ChangeNotifierProvider(create: (context) => AddSuppliersController()),
        ChangeNotifierProvider(create: (context) => PurchaseController()),
        ChangeNotifierProvider(create: (context) => TreasuryController()),
        ChangeNotifierProvider(create: (context) => CategoryController()),
        ChangeNotifierProvider(create: (context) => AddHRController()),
        ChangeNotifierProvider(create: (context) => ManufacturingController()),
        ChangeNotifierProvider(create: (context) => AddUserDataController()),
        ChangeNotifierProvider(create: (context) => AddOrderController()),

      ],
      child: Builder(builder: (context) {
        return MaterialApp.router(
          routeInformationParser: const QRouteInformationParser(),
          routerDelegate: QRouterDelegate(Routes.routes),
          debugShowCheckedModeBanner: false,
          locale: const Locale('ar', 'eg'),
          title: 'ERB System',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // home: TransferTreasury(),
        );
      }),
    );
  }
}
