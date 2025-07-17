import 'package:course/cubit/locale_cubit.dart';
import 'package:course/helper/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalePage extends StatelessWidget {
  const LocalePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("home".tr(context))),
      body: Center(
        child: BlocConsumer<LocaleCubit, ChangeLocaleState>(
          listener: (context, state) {
             ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('تم تغيير اللغة')),
  );
          },
       
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                     
                      context.read<LocaleCubit>().changeLanguage('ar');
                    },
                    child: const Text('ar'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<LocaleCubit>().changeLanguage('en');
                    },
                    child: const Text('en'),
                  ),
                ],
              );
            },
          ),
        ),
      
    );
  }
}
