enum Constants {
  pi(name: 'pi', tex: r'\pi'),
  e(name: 'e', tex: r'e'),
  sqrt2(name: 'sqrt2', tex: r'\sqrt{2}'),
  ;

  /// name = path
  final String name;
  final String tex;

  const Constants({required this.name, required this.tex});
}
