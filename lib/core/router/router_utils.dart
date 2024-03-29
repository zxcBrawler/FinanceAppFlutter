enum Pages {
  auth,
  register,
  mainScreen,
  dashboard,
  transactions,
  profile,
}

extension AppPageExtension on Pages {
  String get screenPath {
    return switch (this) {
      Pages.auth => '/',
      Pages.register => '/register',
      Pages.mainScreen => '/main',
      Pages.dashboard => '/dashboard',
      Pages.transactions => '/transactions',
      Pages.profile => '/profile',
    };
  }

  String get screenName {
    return switch (this) {
      Pages.auth => 'auth',
      Pages.register => 'register',
      Pages.mainScreen => 'main',
      Pages.dashboard => 'Dashboard',
      Pages.transactions => 'Transactions',
      Pages.profile => 'Profile',
    };
  }
}
