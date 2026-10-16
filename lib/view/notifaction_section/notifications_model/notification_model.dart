import 'package:flutter/material.dart';

enum NotificationType {
  today,
  yesterday,
  earlier,
}

class NotificationModel {
  final String title;
  final String description;
  final String time;
  final String category;
  final Color colorContainerActionText;
  final String iconPath;
  final String iconActionText;

  final String? actionText;

  bool isRead;

  NotificationType type;

  NotificationModel({
    required this.title,
    required this.description,
    required this.time,
    required this.category,
    required this.iconPath,
    required this.isRead,
    required this.type,
    this.actionText, required this.iconActionText, required this.colorContainerActionText,
  });
}