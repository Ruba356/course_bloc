import 'package:course/bloc/theme_bloc.dart';
import 'package:course/content/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: ListView.builder(
          itemCount: AppTheme.values.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => {
                context.read<ThemeBloc>().add(
                  ThemeChangedEvent(theme: AppTheme.values[index]),
                ),
              },
              child: ListTile(
                title: Text(AppTheme.values[index].name),
                textColor: appThemeData[AppTheme.values[index]]!.primaryColor,
              ),
            );
          },
        ),
      ),
    );
  }
}
