import 'package:flutter/cupertino.dart';
import 'package:smart_wallet/features/shared/widgets/background_pattern_widget.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundPatternWidget(
      yourWidgetTree: Column(children: [Text("Helo World")]),
    );
  }
}
