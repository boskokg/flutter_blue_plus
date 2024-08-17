import 'package:flutter_blue_plus_platform_interface/flutter_blue_plus_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'BmSetNotifyValueRequest',
    () {
      group(
        'fromMap',
        () {
          test(
            'deserializes the secondary service uuid property as [0x01,0x02] if it is 0102',
            () {
              expect(
                BmSetNotifyValueRequest.fromMap({
                  'remote_id': '',
                  'service_uuid': '0102',
                  'secondary_service_uuid': '0102',
                  'characteristic_uuid': '0102',
                  'force_indications': false,
                  'enable': false,
                }).secondaryServiceUuid?.bytes,
                orderedEquals([
                  0x01,
                  0x02,
                ]),
              );
            },
          );

          test(
            'deserializes the secondary service uuid property as null if it is null',
            () {
              expect(
                BmSetNotifyValueRequest.fromMap({
                  'remote_id': '',
                  'service_uuid': '0102',
                  'secondary_service_uuid': null,
                  'characteristic_uuid': '0102',
                  'force_indications': false,
                  'enable': false,
                }).secondaryServiceUuid,
                isNull,
              );
            },
          );
        },
      );
    },
  );
}
