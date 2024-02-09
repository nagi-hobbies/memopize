import 'package:memopize/application/state/s_const_data.dart';
import 'package:memopize/infrastructure/dataloader/const_data_loader.dart';

class LoadConstDataUseCase {
  LoadConstDataUseCase({
    required this.sConstDataNotifier,
    required this.constName,
  });
  final SConstDataNotifier sConstDataNotifier;
  final String constName;

  Future<void> loadConstData() async {
    final ConstDataLoader loader = ConstDataLoader();
    final String data = await loader.getInitData(constName);
    sConstDataNotifier.add(data);
  }
}
