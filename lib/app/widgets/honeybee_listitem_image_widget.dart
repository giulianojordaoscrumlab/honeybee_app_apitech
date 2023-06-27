import 'package:flutter/material.dart';
import 'package:honeybee/const/colors.dart';
import 'package:honeybee/const/text_styles.dart';

class HoneyBeeListItemWithImage extends StatefulWidget {
  const HoneyBeeListItemWithImage({
    super.key,
    this.jfBelt,
    this.title,
    this.dateTime,
    this.description,
    this.imageURI,
    this.isAsset = true,
    this.screenWidth,
    this.height = 60,
    required this.onPress,
  });
  final bool? jfBelt;
  final String? title;
  final String? dateTime;
  final String? description;
  final String? imageURI;
  final bool? isAsset;
  final double? screenWidth;
  final double height;
  final Function() onPress;

  @override
  State<HoneyBeeListItemWithImage> createState() =>
      _HoneyBeeListItemWithImageState();
}

class _HoneyBeeListItemWithImageState extends State<HoneyBeeListItemWithImage> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPress,
      splashColor: AppColors.primary1.withOpacity(0.3),
      highlightColor: AppColors.primary1.withOpacity(0.2),
      hoverColor: AppColors.primary1.withOpacity(0.1),
      child: Container(
        padding: const EdgeInsets.all(
          8,
        ),
        width: widget.screenWidth,
        margin: const EdgeInsets.only(
          bottom: 8,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: widget.screenWidth! * 0.2,
              height: widget.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: (widget.isAsset == true)
                      ? Image.asset(
                          widget.imageURI!,
                          width: widget.screenWidth! * 0.2,
                          fit: BoxFit.cover,
                        ).image
                      : Image.network(
                          widget.imageURI!,
                          width: widget.screenWidth! * 0.2,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColors.primary1.withOpacity(0.3),
                                  ),
                                ),
                              );
                            }
                          },
                        ).image,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              padding: EdgeInsets.zero,
              width: widget.screenWidth! * 0.55,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //!Date
                  Text(
                    widget.dateTime!,
                    style: HoneyBeeText.small.copyWith(
                      color: AppColors.onBackground.withOpacity(0.7),
                    ),
                  ),
                  //*Title
                  Text(
                    widget.title!,
                    style: HoneyBeeText.h4.copyWith(
                      color: AppColors.primary4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  //?Text
                  Container(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                    width: widget.screenWidth! * 0.5,
                    child: Text(
                      widget.description!,
                      overflow: TextOverflow.ellipsis,
                      style: HoneyBeeText.h6.copyWith(
                        color: AppColors.primary4,
                      ),
                      softWrap: true,
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: widget.jfBelt ?? false,
              child: SizedBox(
                height: 32,
                width: 32,
                child: Image.asset(
                  "assets/images/v2/jfBelt.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
