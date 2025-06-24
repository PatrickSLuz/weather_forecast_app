import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecast_app/app/app_widget.dart';
import 'package:weather_forecast_app/core/cache/i_cache.dart';
import 'package:weather_forecast_app/design_system/dialogs/app_information_dialog.dart';

class FirebaseMessageService {
  final ICache cache;

  FirebaseMessageService(this.cache) {
    setup();
  }

  final _fcm = FirebaseMessaging.instance;

  void setup() async {
    await _fcm.setAutoInitEnabled(true);
    await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    await handleToken();
    await subscribeToTopic();
    handleNotifications();
  }

  Future<void> handleToken() async {
    try {
      final fcmToken = await _fcm.getToken();
      log('Firebase Cloud Message - getToken: $fcmToken');
      cache.setData(key: 'fcmToken', value: fcmToken);

      _fcm.onTokenRefresh.listen(
        (fcmTokenRefresh) {
          if (fcmToken != fcmTokenRefresh) {
            log('Firebase Cloud Message - onTokenRefresh: $fcmTokenRefresh');
            cache.setData(key: 'fcmToken', value: fcmTokenRefresh);
          }
        },
        onDone: () {
          log('Firebase Cloud Message - onTokenRefresh DONE');
        },
        onError: (error) {
          log('Firebase Cloud Message - onTokenRefresh ERROR: ${error.toString()}');
        },
      );
    } catch (e) {
      log('Firebase Cloud Message - Token Error: ${e.toString()}');
    }
  }

  Future<void> subscribeToTopic() async {
    await _fcm.subscribeToTopic('app_clima_atual');
  }

  void handleNotifications() {
    /// quando o app esta em primeiro plano
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final notification = message.notification;
      if (notification == null) return;
      if (notification.body == null) return;
      if (notification.body!.isEmpty) return;

      final context = NavigatorService.key.currentContext;
      if (context != null && context.mounted) {
        showDialog(
          context: context,
          builder: (_) => AppInformationDialog(
            title: notification.title ?? 'Notificação',
            description: notification.body!,
          ),
        );
      }
    });
  }
}
