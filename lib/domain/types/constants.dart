enum Constants {
  pi(name: r"\pi", path: "pi"),
  e(name: r"e", path: "e"),
  sqrt2(name: r"\sqrt{2}", path: "sqrt2"),
  ;

  final String name;
  final String path;

  const Constants({required this.name, required this.path});
}
