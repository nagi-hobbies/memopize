enum Constants {
  pi(name: 'pi', tex: r'\pi'),
  e(name: 'e', tex: r'e'),
  goldenRatio(name: 'golden_ratio', tex: r'\phi'),
  silverRatio(name: 'silver_ratio', tex: r'\sigma'),
  sqrt2(name: 'sqrt2', tex: r'\sqrt{2}'),
  sqrt3(name: 'sqrt3', tex: r'\sqrt{3}'),
  ;

  /// name = path
  final String name;
  final String tex;

  const Constants({required this.name, required this.tex});
}
