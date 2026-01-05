import 'package:go_router/go_router.dart';
import 'package:social_downloader/core/config/global_keys.dart';
import 'package:social_downloader/features/auth/presentation/screens/get_started_screen.dart';
import 'package:social_downloader/features/cat_download/presentation/screens/cat_download.dart';
import 'package:social_downloader/features/cat_download/presentation/screens/cat_download_detail.dart';
import 'package:social_downloader/features/dashboard/presentation/screens/dashboard_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: GetStartedScreen.routeName,
  navigatorKey: navigatorKey,
  routes: [
    GoRoute(
      path: GetStartedScreen.routeName,
      name: GetStartedScreen.routeName,
      builder: (context, state) => GetStartedScreen(),
    ),
    GoRoute(
      path: DashboardScreen.routeName,
      name: DashboardScreen.routeName,
      builder: (context, state) => DashboardScreen(),
    ),
    GoRoute(
      path: CategoryDownloadScreen.routeName,
      name: CategoryDownloadScreen.routeName,
      builder: (context, state) => CategoryDownloadScreen(),
    ),
    GoRoute(
      path: CategoryDownloadDetailScreen.routeName,
      name: CategoryDownloadDetailScreen.routeName,
      builder: (context, state) => CategoryDownloadDetailScreen(),
    ),
  ],
);
