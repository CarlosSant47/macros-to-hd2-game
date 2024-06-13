import 'package:flutter/material.dart';
import 'package:macro_sync_helldivers/stratagems_page/models/stratagems_model.dart';
import 'package:macro_sync_helldivers/stratagems_page/providers/exports_providers.dart';
import 'package:provider/provider.dart';

class StratagemsSelectedWidget extends StatelessWidget {
  const StratagemsSelectedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SelectedProvider provider = Provider.of<SelectedProvider>(context);

    final List<_StratagemFrameIcon> list =
        provider.state.stratagemsSelectedForMission
            .map((stratagemId) => _StratagemFrameIcon(
                  stratagemIcon: _StratagemIcon(
                    stratagemId: stratagemId,
                  ),
                ))
            .toList();

    if (list.length < provider.state.maxStratagemSelected) {
      for (var i = list.length; i < provider.state.maxStratagemSelected; i++) {
        list.add(const _StratagemFrameIcon());
      }
    }

    return Wrap(children: list);
  }
}

class _StratagemIcon extends StatelessWidget {
  final String stratagemId;

  const _StratagemIcon({Key? key, required this.stratagemId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StratagemsProvider provider =
        Provider.of<StratagemsProvider>(context, listen: false);

    StratagemModel stratagem = provider.getStratagemById(stratagemId);

    return GestureDetector(
      onTap: () => provider.onSelectedIconTap(stratagemId, context),
      child: Container(
        width: 100,
        height: 100,
        color: Colors.black.withOpacity(0.7),
        child: Image.asset(stratagem.icon),
      ),
    );
  }
}

class _StratagemFrameIcon extends StatelessWidget {
  const _StratagemFrameIcon({
    Key? key,
    this.stratagemIcon,
  }) : super(key: key);

  final _StratagemIcon? stratagemIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      width: 50,
      height: 50,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.amber,
          width: 1,
        ),
      ),
      child: stratagemIcon,
    );
  }
}

// class _StratagemFrameIcon extends StatelessWidget {
//   const _StratagemFrameIcon({
//     Key? key,
//     this.stratagem,
//   }) : super(key: key);

//   final StratagemModel? stratagem;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(4),
//       width: 50,
//       height: 50,
//       padding: const EdgeInsets.all(2),
//       decoration: BoxDecoration(
//         color: Colors.black.withOpacity(0.7),
//         border: Border.all(
//           color: Colors.amber,
//           width: 1,
//         ),
//       ),
//       child: stratagem != null ? Image.asset(stratagem!.icon) : null,
//     );
//   }
// }
