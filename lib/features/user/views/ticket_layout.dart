import 'package:dental/common/widgets/button/custom_button.dart';
import 'package:dental/common/widgets/clipper/ticket_clipper.dart';
import 'package:dental/common/widgets/painter/vertical_dash_line_paint.dart';
import 'package:dental/core/app_color.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:super_icons/super_icons.dart';

class TicketLayout extends StatelessWidget {
  const TicketLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 90,
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: oBlack.withAlpha(30),
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
        ),
        ClipPath(
          clipper: TicketClipper(positionRatio: .25),
          child: Container(
            color: oWhite,
            height: 90,
            width: double.infinity,
            child: CustomPaint(
              painter: VerticalDashLinePaint(positionRatio: .25, dashSize: 3, dashSpace: 3),
              child: Row(
                children: [
                  SizedBox(
                    width: (context.screenWidth * .25) - 10.whenLandscape(30)!,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Antrian').tsTitleL().bold().family('Roboto').space(1.5),
                        Transform.scale(
                          scaleY: 1.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('A-').tsHeadlineL().bold().family('Roboto'),
                              Text('001').tsHeadlineL().bold().family('Roboto').clr(oRed),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Scaling').tsTitleM().bold(),
                                  Text('12-Feb-2025'),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Waktu').tsTitleM().bold(),
                                  Text('13:00'),
                                ],
                              ),
                              Icon(SuperIcons.lc_moveRight)
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              color: oBlue70,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text('Drg. Icha Kimberly').center().bold(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
