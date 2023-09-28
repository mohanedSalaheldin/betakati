import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app0820/modules/business_screen/business_screen.dart';
import 'package:new_app0820/modules/science_screen/science_screen.dart';
import 'package:new_app0820/modules/sports_screen/sport_screen.dart';
import 'package:new_app0820/shered/cubit/states.dart';
import 'package:new_app0820/shered/networks/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsAppStates> {
  // NewsCubit(super.initialState);
  NewsCubit() : super(NewsAppInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  List screens = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
  ];

  List<BottomNavigationBarItem> navItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
  ];

  int currentIndex = 0;
  void changeNavBar(int index) {
    currentIndex = index;
    if (index == 1) {
      getSports();
    }
    if (index == 2) {
      getScience();
    }
    emit(NewsChangeBottomNavState());
  }

  List business = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    if (business.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'business',
          'apikey': '1d2932f70eee4185b04e61907b01e31f',
        },
      ).then((value) {
        business = value?.data['articles'];

        emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        emit(NewsGetBusinessErrorState(error.toString()));
      });
    } else {
      emit(NewsGetBusinessSuccessState());
    }
  }

  List sports = [];
  void getSports() {
    emit(NewsGetSportsLoadingState());
    if (sports.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'sports',
          'apikey': '1d2932f70eee4185b04e61907b01e31f',
        },
      ).then((value) {
        sports = value?.data['articles'];
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  List science = [];
  void getScience() {
    emit(NewsGetScieneLoadingState());
    if (science.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'science',
          'apikey': '1d2932f70eee4185b04e61907b01e31f',
        },
      ).then((value) {
        science = value?.data['articles'];
        emit(NewsGetScieneSuccessState());
      }).catchError((error) {
        emit(NewsGetScieneErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScieneSuccessState());
    }
  }

  List search = [];
  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': value,
        'apikey': '1d2932f70eee4185b04e61907b01e31f',
      },
    ).then((value) {
      search = value?.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }
}

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  bool isDark = false;

  void changeTheme() {
    isDark = !isDark;
    // print('dark is $isDark');
    emit(AppChangeThemeState());
  }
}
