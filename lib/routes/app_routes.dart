import 'package:flutter/material.dart';
import '../presentation/genre_selection_screen/genre_selection_screen.dart';
import '../presentation/events_discovery_screen/events_discovery_screen.dart';

import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String genreSelectionScreen = '/genre_selection_screen';
  static const String eventsDiscoveryScreen = '/events_discovery_screen';

  static const String appNavigationScreen = '/app_navigation_screen';
  static const String initialRoute = '/';

  static Map<String, WidgetBuilder> get routes => {
        genreSelectionScreen: GenreSelectionScreen.builder,
        eventsDiscoveryScreen: EventsDiscoveryScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: AppNavigationScreen.builder
      };
}
