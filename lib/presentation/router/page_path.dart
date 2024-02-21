/// 画面ID
enum PageId {
  title,
  collection,
  memorize,
}

/// 画面パス
extension PagePath on PageId {
  String get path => switch (this) {
        PageId.title => '/',
        PageId.collection => '/collection',
        PageId.memorize => '/memorize',
      };
}

/// 画面名
extension PageName on PageId {
  String get routeName => switch (this) {
        PageId.title => 'title',
        PageId.collection => 'collection',
        PageId.memorize => 'memorize',
      };
}
