import 'package:course/api/todo_api.dart';
import 'package:course/bloc/counter_bloc.dart';
import 'package:course/bloc/data_bloc.dart';
import 'package:course/bloc/data_freezed/data_freezed_bloc.dart';
import 'package:course/bloc/internet_bloc.dart';
import 'package:course/bloc/scroll_list_bloc.dart';
import 'package:course/bloc/theme_bloc.dart';
import 'package:course/cubit/locale_cubit.dart';
import 'package:course/helper/app_localizations.dart';
import 'package:course/helper/my_bloc_observer.dart';
import 'package:course/pages/connection_page.dart';
import 'package:course/pages/counter_page.dart';
import 'package:course/pages/data_page.dart';
import 'package:course/pages/locale_page.dart';
import 'package:course/pages/scroll_list_page.dart';
import 'package:course/pages/theme_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LocaleCubit()..getSavedLanguage()),
        BlocProvider(create: (_) => InternetBloc()),
        BlocProvider(create: (_) => ThemeBloc()..add(GetCurrentThemeEvent())),
        BlocProvider(create: (_) => DataBloc()..add(GetAllDataEvent())),
        BlocProvider(
          create: (_) =>
              DataFreezedBloc(todosApi: TodosApi())
                ..add(const DataFreezedEvent.getAllTodos()),
        ),
        BlocProvider(create: (_) => ScrollListBloc()..add(GetPostsEvent())),
      ],
      child: BlocSelector<ThemeBloc, ThemeState, ThemeData?>(
        selector: (state) => state is LoadedThemeState ? state.themeData : null,
        builder: (context, themeData) {
          if (themeData == null) return const SizedBox();

          return BlocSelector<LocaleCubit, ChangeLocaleState, Locale>(
            selector: (state) => state.locale,
            builder: (context, locale) {
              return MaterialApp(
                theme: themeData,
                locale: locale,
                supportedLocales: const [Locale('en'), Locale('ar')],
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  for (var locale in supportedLocales) {
                    if (deviceLocale != null &&
                        deviceLocale.languageCode == locale.languageCode) {
                      return deviceLocale;
                    }
                  }
                  return supportedLocales.first;
                },
                home: const ScrollListPage(),
                debugShowCheckedModeBanner: false,
              );
            },
          );
        },
      ),
    );
  }
}
