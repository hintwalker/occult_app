import 'package:flutter/material.dart';
import 'package:lasotuvi_request_shared/lasotuvi_request_shared.dart';
// import 'package:lasotuvi_chart_tag/lasotuvi_chart_tag.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:sunoom/sunoom.dart';
import 'package:tauari_ui/tauari_ui.dart';
import 'package:tuvi_domain/tuvi_domain.dart';
// import 'tag_item_in_chart.widget.dart';

class RequestItemContentWidget extends StatelessWidget {
  const RequestItemContentWidget(
    this.data, {
    super.key,
    required this.colorScheme,
    required this.translate,
    this.onTap,
    required this.tags,
    this.uid,
  });
  final Request data;
  final Iterable<Tag> tags;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final void Function(Request)? onTap;
  final String? uid;

  String canName(Can can) => translate(can.name);
  String chiName(Chi chi) => translate(chi.name);

  @override
  Widget build(BuildContext context) {
    final birthday =
        data.birthday.toMoment(TimeZone(offsetInHour: data.timeZoneOffset));
    final now = DateTime.now();
    final yearsOld = yearOld(
        birthday: birthday,
        now: now.toMoment(TimeZone(offsetInHour: now.timeZoneOffset.inHours)));
    final yearsOldFromWatchingYear = yearOld(
        birthday: birthday,
        now: DateTime(data.watchingYear, 12, 31, 23, 59, 59)
            .toMoment(TimeZone(offsetInHour: now.timeZoneOffset.inHours)));
    return Card(
      child: InkWell(
        onTap: onTap != null ? () => onTap!(data) : null,
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            // onTap: onTap != null ? () => onTap!(context, data, uid) : null,
            children: [
              SizedBox(
                width: 64.0,
                height: 72.0,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8.0,
                    ),
                    Expanded(
                        child: SizedBox(
                            width: 54.0,
                            height: 54.0,
                            child: CircleHumanAvatar(
                              gender: data.gender.intValue,
                              path: data.avatar,
                              size: 24.0,
                              fit: BoxFit.scaleDown,
                            ))),
                    Text(
                      '$yearsOld${translate('yearsOldSuffix')}',
                      style: const TextStyle(
                          fontSize: 13, fontStyle: FontStyle.italic),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 24.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HoriRequestNameWidget(data.name),
                    Text(
                      birthday.toGregorianDateTimeString(),
                      style: const TextStyle(fontSize: 14),
                    ),
                    Text(
                      birthday.toLuniSolarDateString(
                          canName: canName, chiName: chiName),
                      style: const TextStyle(fontSize: 14),
                    ),
                    Row(
                      children: [
                        Text(
                          '${translate('watchingYear')}: ',
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          '${data.watchingYear}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          '($yearsOldFromWatchingYear ${translate('yearsOldSuffix')})',
                          style: const TextStyle(fontSize: 14),
                          overflow: TextOverflow.fade,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${translate("created")}: ${data.created.toStringVn()}',
                          style: TextStyle(
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              color: colorScheme.outline),
                        )
                      ],
                    ),
                  ],
                ),
                // trailing: IconButton(
                //     onPressed: () => onTap(data.source, uid),
                //     icon: const Icon(Icons.keyboard_arrow_right)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
