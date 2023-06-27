import 'package:flutter/material.dart';
import 'package:honeybee/app/models/countdowndata_model.dart';
import 'package:honeybee/const/colors.dart';
import 'package:honeybee/const/text_styles.dart';

class HoneyBeeCountdown extends StatefulWidget {
  const HoneyBeeCountdown({super.key, required this.countdownData});
  final CountdownData countdownData;

  @override
  State<HoneyBeeCountdown> createState() => _HoneyBeeCountdownState();
}

class _HoneyBeeCountdownState extends State<HoneyBeeCountdown> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //! Dias
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.countdownData.dias.toString().padLeft(2, '0'),
                style: HoneyBeeText.h2.copyWith(
                  color: AppColors.primary4,
                  fontSize: 20 * MediaQuery.of(context).textScaleFactor,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Text(
                  "dias",
                  style: HoneyBeeText.small.copyWith(
                    color: AppColors.primary4,
                    fontSize: 9 * MediaQuery.of(context).textScaleFactor,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(
            flex: 1,
          ),
          //! Meses
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.countdownData.horas.toString().padLeft(2, '0'),
                style: HoneyBeeText.h2.copyWith(
                  color: AppColors.primary4,
                  fontSize: 20 * MediaQuery.of(context).textScaleFactor,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Text(
                  "horas",
                  style: HoneyBeeText.small.copyWith(
                    color: AppColors.primary4,
                    fontSize: 9 * MediaQuery.of(context).textScaleFactor,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(
            flex: 1,
          ),
          //! Meses
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.countdownData.minutos.toString().padLeft(2, '0'),
                style: HoneyBeeText.h2.copyWith(
                  color: AppColors.primary4,
                  fontSize: 20 * MediaQuery.of(context).textScaleFactor,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Text(
                  "minutos",
                  style: HoneyBeeText.small.copyWith(
                    color: AppColors.primary4,
                    fontSize: 9 * MediaQuery.of(context).textScaleFactor,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(
            flex: 1,
          ),
          //! Segundos
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.countdownData.segundos.toString().padLeft(2, '0'),
                style: HoneyBeeText.h2.copyWith(
                  color: AppColors.primary4,
                  fontSize: 20 * MediaQuery.of(context).textScaleFactor,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Text(
                  "segundos",
                  style: HoneyBeeText.small.copyWith(
                    color: AppColors.primary4,
                    fontSize: 8 * MediaQuery.of(context).textScaleFactor,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
