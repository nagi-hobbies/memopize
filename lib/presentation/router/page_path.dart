/// 画面ID
enum PageId {
  select,
  game,
}

/// 画面パス
extension PagePath on PageId {
  String get path => switch (this) {
        PageId.select => '/select',
        PageId.game => '/game/:constPath',
      };
}

/// 画面名
extension PageName on PageId {
  String get routeName => switch (this) {
        PageId.select => 'select',
        PageId.game => 'game',
      };
}
