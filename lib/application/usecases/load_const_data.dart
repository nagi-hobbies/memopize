import 'package:memopize/application/state/s_const_data.dart';
import 'package:memopize/infrastructure/assets/const_value_loader.dart';

class LoadConstValueUseCase {
  LoadConstValueUseCase({
    required this.sConstValueNotifier,
    required this.constName,
  });
  final SConstValueNotifier sConstValueNotifier;
  final String constName;

  Future<void> loadConstValue() async {
    final ConstValueLoader loader = ConstValueLoader();
    final String data = await loader.getInitValue(constName);
    sConstValueNotifier.add(data);
  }
}
