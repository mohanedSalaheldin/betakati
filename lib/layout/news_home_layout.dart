import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app0820/modules/search_screen/search_screen.dart';
import 'package:new_app0820/shered/components/componens.dart';
import 'package:new_app0820/shered/cubit/cubit.dart';
import 'package:new_app0820/shered/cubit/states.dart';
import 'package:new_app0820/shered/networks/remote/dio_helper.dart';

// base url : https://newsapi.org/
// method url: v2/top-headlines?
// queries: country=eg&category=business&apikey=65f7f556ec76449fa7dc7c0069f040ca

class NewHomeLayout extends StatelessWidget {
  const NewHomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsAppStates>(
        builder: ((context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('News24'),
              actions: [
                IconButton(
                  onPressed: () {
                    navigateTo(context, const SearchScreen());
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 30.0,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // AppCubit.get(context).changeTheme();
                  },
                  icon: const Icon(
                    Icons.brightness_4_outlined,
                    size: 30.0,
                  ),
                ),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.deepOrange,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeNavBar(index);
              },
              items: cubit.navItems,
            ),
          );
        }),
        listener: ((context, state) {}),
      ),
    );
  }
}
