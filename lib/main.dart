import 'package:flutter/material.dart';
import 'package:project_minia/core/di/module.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'features/home/domain/entity/products_entity.dart';
import 'pharma.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getHive();
  await setupDependencies();
  runApp(const PharmaApp());
}
