import 'package:flutter/material.dart';
import 'package:honeybee/app/models/fighter_model.dart';
import 'package:honeybee/app/widgets/honeybee_button_widget.dart';
import 'package:honeybee/const/colors.dart';
import 'package:honeybee/const/text_styles.dart';

class HoneyBeeFighterCard extends StatelessWidget {
  const HoneyBeeFighterCard({
    super.key,
    required this.following,
    required this.figther,
  });

  final bool following;
  final FighterModel figther;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                figther.profilePhoto!,
                alignment: Alignment.topCenter,
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
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              figther.name!,
              style: HoneyBeeText.h3,
            ),
            Text(
              figther.category!.toUpperCase(),
              style: TextStyle(
                letterSpacing: 2,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.colorScheme.onBackground.withOpacity(0.7),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              child: HoneyBeeButton(
                onPressed: () {},
                child: Text(following ? 'Seguindo' : 'Seguir'),
                background:
                    following ? null : AppColors.colorScheme.surfaceVariant,
              ),
            )
          ],
        ),
      ),
    );
  }
}
