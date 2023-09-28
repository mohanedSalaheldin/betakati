import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app0820/layout/news_home_layout.dart';
import 'package:new_app0820/shered/bloc_observer.dart';
import 'package:new_app0820/shered/cubit/cubit.dart';
import 'package:new_app0820/shered/cubit/states.dart';
import 'package:new_app0820/shered/networks/remote/dio_helper.dart';
import 'package:new_app0820/shered/shered_prefs.dart';


void main() async {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  WidgetsFlutterBinding.ensureInitialized();
  // await CacheHelper.init();
  bool isDark = await CacheHelper.getBoolValuesSF();
  runApp(MainApp(isDark));
}

class MainApp extends StatelessWidget {
  // const MainApp( {super.key});
  final bool isDark;
  MainApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit(),
        ),
        BlocProvider(
          create: (context) => NewsCubit()..getBusiness(),
        )
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: ((context, state) {}),
        builder: ((context, state) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              primaryColor: Colors.white,
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
                // backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              scaffoldBackgroundColor: Colors.white,
              textTheme: const TextTheme(
                bodyLarge: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600),
              ),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
                // backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Color.fromARGB(255, 23, 23, 22),
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: Color.fromARGB(255, 23, 23, 22),
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              scaffoldBackgroundColor: const Color.fromARGB(255, 23, 23, 22),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                unselectedItemColor: Colors.grey,
                backgroundColor: Color.fromARGB(255, 23, 23, 22),
              ),
              textTheme: const TextTheme(
                bodyLarge: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            themeMode: ThemeMode.dark,
            // AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: const NewHomeLayout(),
          );
        }),
      ),
    );
  }
}
