enum AppPage {
  splash,
  welcome,
  signup,
  login,
  home,
  liked,
  details,
  route,
  contributions,
  addContribution,
  editContribution,
  inAppNotifications,
  tours,
  settings,
  about,
}

extension AppPageName on AppPage {
  String get name {
    switch (this) {
      case AppPage.splash:
        return 'splash';
      case AppPage.welcome:
        return 'welcome';
      case AppPage.signup:
        return 'signup';
      case AppPage.login:
        return 'login';
      case AppPage.home:
        return 'home';
      case AppPage.liked:
        return 'liked';
      case AppPage.details:
        return 'details';
      case AppPage.route:
        return 'route';
      case AppPage.tours:
        return 'tours';
      case AppPage.settings:
        return 'settings';
      case AppPage.inAppNotifications:
        return 'notifications';
      case AppPage.about:
        return 'about';
      case AppPage.contributions:
        return 'contributions';
      case AppPage.addContribution:
        return 'addContribution';
      case AppPage.editContribution:
        return 'editContribution';
    }
  }
}

/*
List<String> get appPageNames {
  return <String>[
    AppPage.splash.name,
    AppPage.welcome.name,
    AppPage.login.name,
    AppPage.signup.name,
    AppPage.home.name,
    AppPage.liked.name,
    AppPage.details.name,
    AppPage.route.name,
    AppPage.contributions.name,
    AppPage.addContribution.name,
    AppPage.editContribution.name,
    AppPage.tours.name,
    AppPage.settings.name,
    AppPage.notifications.name,
    AppPage.about.name,
  ];
}
*/