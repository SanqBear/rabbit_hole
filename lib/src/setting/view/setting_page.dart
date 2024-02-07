import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabbit_playground/src/setting/setting.dart';
import 'package:setting_repository/setting_repository.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  static const routeName = "/setting";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: BlocProvider(
          create: (_) => SettingCubit(context.read<SettingRepository>()),
          child: const SettingForm()),
    );
  }
}
