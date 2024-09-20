import 'package:comp30022/color.dart';
import 'package:comp30022/components/BaseCustomCard.dart';

class YellowBorderYellowCard extends BaseCustomCard {
  const YellowBorderYellowCard({
    super.key,
    super.width = 200,
    super.height = 60,
    super.borderWidth = 4.0,
    super.borderRadius,
    super.child,
  }) : super(
          borderColor: AppColors.yellowCream,
          backgroundColor: AppColors.cream,
        );
}
