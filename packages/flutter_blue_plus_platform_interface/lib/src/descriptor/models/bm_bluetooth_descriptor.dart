import '../../common/models/device_identifier.dart';
import '../../common/models/guid.dart';

class BmBluetoothDescriptor {
  final DeviceIdentifier remoteId;
  final Guid serviceUuid;
  final Guid characteristicUuid;
  final Guid descriptorUuid;

  BmBluetoothDescriptor({
    required this.remoteId,
    required this.serviceUuid,
    required this.characteristicUuid,
    required this.descriptorUuid,
  });

  factory BmBluetoothDescriptor.fromMap(
    Map<dynamic, dynamic> json,
  ) {
    return BmBluetoothDescriptor(
      remoteId: DeviceIdentifier(json['remote_id']),
      serviceUuid: Guid(json['service_uuid']),
      characteristicUuid: Guid(json['characteristic_uuid']),
      descriptorUuid: Guid(json['descriptor_uuid']),
    );
  }

  Map<dynamic, dynamic> toMap() {
    return {
      'remote_id': remoteId.str,
      'service_uuid': serviceUuid.str,
      'characteristic_uuid': characteristicUuid.str,
      'descriptor_uuid': descriptorUuid.str,
    };
  }
}