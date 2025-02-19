import 'package:flutter/material.dart';

class ActionItem {
  Widget icon;
  VoidCallback? callback;

  ActionItem({required this.icon, this.callback});
}
