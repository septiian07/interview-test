import 'package:flutter/material.dart';
import 'package:interview_task/src/helpers/scalable_dp_helper.dart';
import 'package:interview_task/src/ui/shared/colors.dart';
import 'package:interview_task/src/ui/shared/dimens.dart';
import 'package:interview_task/src/ui/shared/styles.dart';
import 'package:interview_task/src/ui/shared/ui_helpers.dart';

class PlaylistMenu extends StatelessWidget {
  final VoidCallback onTap;
  final VoidCallback onSave;
  final VoidCallback onDelete;
  final String? title;
  final String? description;
  final bool? fileExists;

  const PlaylistMenu({
    Key? key,
    required this.onTap,
    required this.onSave,
    required this.onDelete,
    this.title,
    this.description,
    this.fileExists,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: SDP.sdp(6)),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: BaseColors.primary,
            ),
            borderRadius: BorderRadius.circular(SDP.sdp(smallRadius)),
          ),
          padding: EdgeInsets.symmetric(
            vertical: SDP.sdp(10),
            horizontal: SDP.sdp(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.play_circle_filled,
                    size: SDP.sdp(34),
                  ),
                  horizontalSpace(SDP.sdp(space)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: screenWidthPercentage(
                          context,
                          percentage: 0.5,
                        ),
                        child: Text(
                          title ?? '',
                          style: interBlackBoldTextStyle.copyWith(
                            fontSize: SDP.sdp(headline6),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      verticalSpace(SDP.sdp(4)),
                      SizedBox(
                        width: screenWidthPercentage(
                          context,
                          percentage: 0.5,
                        ),
                        child: Text(
                          description ?? '',
                          style: interBlackRegularTextStyle.copyWith(
                            fontSize: SDP.sdp(headline66),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              fileExists == true
                  ? InkWell(
                      onTap: onDelete,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: SDP.sdp(6),
                          horizontal: SDP.sdp(12),
                        ),
                        decoration: BoxDecoration(
                          color: BaseColors.green,
                          borderRadius:
                              BorderRadius.circular(SDP.sdp(smallRadius)),
                        ),
                        child: Text(
                          "Tersimpan",
                          style: interBlackSemiBoldTextStyle.copyWith(
                            fontSize: SDP.sdp(headline66),
                            color: BaseColors.white,
                          ),
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: onSave,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: SDP.sdp(6),
                          horizontal: SDP.sdp(12),
                        ),
                        decoration: BoxDecoration(
                          color: BaseColors.blue,
                          borderRadius:
                              BorderRadius.circular(SDP.sdp(smallRadius)),
                        ),
                        child: Text(
                          "Simpan",
                          style: interBlackSemiBoldTextStyle.copyWith(
                            fontSize: SDP.sdp(headline66),
                            color: BaseColors.white,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
