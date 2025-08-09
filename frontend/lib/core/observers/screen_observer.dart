import 'dart:developer';

import 'package:flutter/material.dart';

class ScreenObserver extends NavigatorObserver{
  @override
  void didChangeTop(Route topRoute, Route? previousTopRoute) {
    log("ScreenObserver || didChangeTop called for route: ${topRoute.settings.name}", level: 800);
    log("ScreenObserver || Previous top route: ${previousTopRoute?.settings.name}", level: 800);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    log("ScreenObserver || didPop called for route: ${route.settings.name}" , level: 800);
    log("ScreenObserver || Previous route: ${previousRoute?.settings.name}" , level: 800);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    log("ScreenObserver || didPush called for route: ${route.settings.name}", level: 800);
    log("ScreenObserver || Previous route: ${previousRoute?.settings.name}", level: 800);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    log("ScreenObserver || didRemove called for route: ${route.settings.name}", level: 800);
    log("ScreenObserver || Previous route: ${previousRoute?.settings.name}", level: 800);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    log("ScreenObserver || didReplace called with new route: ${newRoute?.settings.name}", level: 800);
    log("ScreenObserver || Old route: ${oldRoute?.settings.name}", level: 800);
  }

  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    log("ScreenObserver || didStartUserGesture called for route: ${route.settings.name}", level: 800);
    log("ScreenObserver || Previous route: ${previousRoute?.settings.name}", level: 800);
  }

  @override
  void didStopUserGesture() {
    log("ScreenObserver || didStopUserGesture called", level: 800);
  }


}