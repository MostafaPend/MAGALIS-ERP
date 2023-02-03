
import 'package:erb_system/view/home/homepage.dart';
import 'package:erb_system/view/store/add_store.dart';
import 'package:erb_system/view/store/stores.dart';
import 'package:qlevar_router/qlevar_router.dart';

class Routes {
  static final routes = <QRoute>[
    QRoute(path: '/home', builder: () => const HomePage()),
    QRoute(
      path: '/add_Stock',
      builder: () => const add_Stock(),
    ),
    QRoute(
      path: '/Stock',
      builder: () =>  Stock(),
    ),
  ];
}
