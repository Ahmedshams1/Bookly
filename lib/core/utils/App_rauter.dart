import 'package:bookly/Features/home/data/presentation/views/book_details_View.dart';
import 'package:bookly/Features/home/data/presentation/views/home_view.dart';
import 'package:bookly/Features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const KHomeView = '/HomeView';
  static const KBookDetailsView = '/bookDetailsView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        path: KHomeView,
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: KBookDetailsView,
        builder: (context, state) => BookDetailsView(),
      ),
    ],
  );
}