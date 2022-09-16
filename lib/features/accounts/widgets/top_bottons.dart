import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_buy/features/accounts/widgets/account_buttons.dart';

class TopButtonColumn extends StatelessWidget {
  const TopButtonColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButtons(text: 'Your orders', onTap: () {}),
            AccountButtons(text: 'Become a seller', onTap: () {}),
          ],
        ),
        10.verticalSpace,
        Row(
          children: [
            AccountButtons(text: 'Log Out ', onTap: () {}),
            AccountButtons(text: 'Become a seller', onTap: () {}),
          ],
        ),
      ],
    );
  }
}
