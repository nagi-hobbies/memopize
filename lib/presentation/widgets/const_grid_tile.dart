import 'package:flutter/material.dart';
import 'package:memopize/domain/types/display_const_data.dart';

class ConstGridTile extends StatelessWidget {
  const ConstGridTile({super.key, required this.displaCconstData});
  final DisplayConstData displaCconstData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      alignment: Alignment.center,
      child: Text('displayConstDataList[index].name'),
    );
  }
}
