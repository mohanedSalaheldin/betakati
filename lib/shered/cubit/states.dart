abstract class NewsAppStates {}

abstract class AppStates {}

class AppInitialState extends AppStates {}

class NewsAppInitialState extends NewsAppStates {}

class NewsChangeBottomNavState extends NewsAppStates {}

class NewsGetBusinessLoadingState extends NewsAppStates {}

class NewsGetBusinessSuccessState extends NewsAppStates {}

class NewsGetBusinessErrorState extends NewsAppStates {
  final error;

  NewsGetBusinessErrorState(this.error);
}

class NewsGetSportsLoadingState extends NewsAppStates {}

class NewsGetSportsSuccessState extends NewsAppStates {}

class NewsGetSportsErrorState extends NewsAppStates {
  final error;

  NewsGetSportsErrorState(this.error);
}

class NewsGetScieneLoadingState extends NewsAppStates {}

class NewsGetScieneSuccessState extends NewsAppStates {}

class NewsGetScieneErrorState extends NewsAppStates {
  final error;

  NewsGetScieneErrorState(this.error);
}
class NewsGetSearchLoadingState extends NewsAppStates {}

class NewsGetSearchSuccessState extends NewsAppStates {}

class NewsGetSearchErrorState extends NewsAppStates {
  final error;

  NewsGetSearchErrorState(this.error);
}

class AppChangeThemeState extends AppStates {}
