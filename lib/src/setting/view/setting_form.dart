import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabbit_playground/src/setting/setting.dart';

class SettingForm extends StatelessWidget {
  const SettingForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingCubit, SettingState>(
      listener: (context, state) {
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child : DropdownButton<ThemeMode>(
          value : context.select((SettingCubit cubit) => cubit.state.themeMode),
          onChanged:(value) async => await context.read<SettingCubit>().updateTheme(value ?? ThemeMode.system),
          items: const [
            DropdownMenuItem(
              value: ThemeMode.system,
              child: Text('System Theme'),
            ),
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Text('Light Theme'),
            ),
            DropdownMenuItem(
              value: ThemeMode.dark,
              child: Text('Dark Theme'),
            )
          ],
        )
      )
    );
  }

}