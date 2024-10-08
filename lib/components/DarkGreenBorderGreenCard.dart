import 'package:comp30022/color.dart';
import 'package:comp30022/components/BaseCustomCard.dart';

class DarkGreenBorderGreenCard extends BaseCustomCard {
  const DarkGreenBorderGreenCard({
    super.key,
    super.child,
    bool? isShadowOn,
    super.width,
    super.height,
    double super.borderWidth = 6.0,
    super.borderRadius,
  }) : super(
          borderColor: AppColors.resultsDarkGreen, // Yellow border color
          backgroundColor: AppColors.diagnosticGreen, // White background
          isShadowOn: isShadowOn ?? true,
        );
}
