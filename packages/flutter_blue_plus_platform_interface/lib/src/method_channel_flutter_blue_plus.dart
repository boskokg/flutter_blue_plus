import 'package:flutter/services.dart';

import 'adapter/models/bm_bluetooth_adapter_state.dart';
import 'characteristic/models/bm_read_characteristic_request.dart';
import 'characteristic/models/bm_set_notify_value_request.dart';
import 'characteristic/models/bm_write_characteristic_request.dart';
import 'common/enums/log_level.dart';
import 'common/models/device_identifier.dart';
import 'common/models/options.dart';
import 'common/models/phy_support.dart';
import 'descriptor/models/bm_read_descriptor_request.dart';
import 'descriptor/models/bm_write_descriptor_request.dart';
import 'device/models/bm_bond_state_response.dart';
import 'device/models/bm_connect_request.dart';
import 'device/models/bm_connection_priority_request.dart';
import 'device/models/bm_devices_list.dart';
import 'device/models/bm_mtu_change_request.dart';
import 'device/models/bm_preferred_phy.dart';
import 'flutter_blue_plus_platform.dart';
import 'scan/models/bm_scan_settings.dart';

const _channel = MethodChannel('flutter_blue_plus/methods');

/// An implementation of [FlutterBluePlusPlatform] that uses method channels.
class MethodChannelFlutterBluePlus extends FlutterBluePlusPlatform {
  @override
  Future<void> clearGattCache(
    DeviceIdentifier device,
  ) async {
    await _channel.invokeMethod<void>(
      'clearGattCache',
      device.str,
    );
  }

  @override
  Future<bool> connect(
    BmConnectRequest request,
  ) async {
    final result = await _channel.invokeMethod<bool>(
      'connect',
      request.toMap(),
    );

    return result!;
  }

  @override
  Future<int> connectedCount() async {
    final result = await _channel.invokeMethod<int>(
      'connectedCount',
    );

    return result!;
  }

  @override
  Future<bool> createBond(
    DeviceIdentifier device,
  ) async {
    final result = await _channel.invokeMethod<bool>(
      'createBond',
      device.str,
    );

    return result!;
  }

  @override
  Future<bool> disconnect(
    DeviceIdentifier device,
  ) async {
    final result = await _channel.invokeMethod<bool>(
      'disconnect',
      device.str,
    );

    return result!;
  }

  @override
  Future<void> discoverServices(
    DeviceIdentifier device,
  ) async {
    await _channel.invokeMethod<void>(
      'discoverServices',
      device.str,
    );
  }

  @override
  Future<int> flutterRestart() async {
    final result = await _channel.invokeMethod<int>(
      'flutterRestart',
    );

    return result!;
  }

  @override
  Future<String> getAdapterName() async {
    final result = await _channel.invokeMethod<String>(
      'getAdapterName',
    );

    return result!;
  }

  @override
  Future<BmBluetoothAdapterState> getAdapterState() async {
    final result = await _channel.invokeMethod<Map<dynamic, dynamic>>(
      'getAdapterState',
    );

    return BmBluetoothAdapterState.fromMap(result!);
  }

  @override
  Future<BmBondStateResponse> getBondState(
    DeviceIdentifier device,
  ) async {
    final result = await _channel.invokeMethod<Map<dynamic, dynamic>>(
      'getBondState',
      device.str,
    );

    return BmBondStateResponse.fromMap(result!);
  }

  @override
  Future<BmDevicesList> getBondedDevices() async {
    final result = await _channel.invokeMethod<Map<dynamic, dynamic>>(
      'getBondedDevices',
    );

    return BmDevicesList.fromMap(result!);
  }

  @override
  Future<PhySupport> getPhySupport() async {
    final result = await _channel.invokeMethod<Map<dynamic, dynamic>>(
      'getPhySupport',
    );

    return PhySupport.fromMap(result!);
  }

  @override
  Future<BmDevicesList> getSystemDevices() async {
    final result = await _channel.invokeMethod<Map<dynamic, dynamic>>(
      'getSystemDevices',
    );

    return BmDevicesList.fromMap(result!);
  }

  @override
  Future<bool> isSupported() async {
    final result = await _channel.invokeMethod<bool>(
      'isSupported',
    );

    return result!;
  }

  @override
  Future<void> readCharacteristic(
    BmReadCharacteristicRequest request,
  ) async {
    await _channel.invokeMethod<void>(
      'readCharacteristic',
      request.toMap(),
    );
  }

  @override
  Future<void> readDescriptor(
    BmReadDescriptorRequest request,
  ) async {
    await _channel.invokeMethod<void>(
      'readDescriptor',
      request.toMap(),
    );
  }

  @override
  Future<void> readRssi(
    DeviceIdentifier device,
  ) async {
    await _channel.invokeMethod<void>(
      'readRssi',
      device.str,
    );
  }

  @override
  Future<bool> removeBond(
    DeviceIdentifier device,
  ) async {
    final result = await _channel.invokeMethod<bool>(
      'removeBond',
      device.str,
    );

    return result!;
  }

  @override
  Future<void> requestConnectionPriority(
    BmConnectionPriorityRequest request,
  ) async {
    await _channel.invokeMethod<void>(
      'requestConnectionPriority',
      request.toMap(),
    );
  }

  @override
  Future<void> requestMtu(
    BmMtuChangeRequest request,
  ) async {
    await _channel.invokeMethod<void>(
      'requestMtu',
      request.toMap(),
    );
  }

  @override
  Future<void> setLogLevel(
    LogLevel level,
  ) async {
    await _channel.invokeMethod<void>(
      'setLogLevel',
      level.index,
    );
  }

  @override
  Future<bool> setNotifyValue(
    BmSetNotifyValueRequest request,
  ) async {
    final result = await _channel.invokeMethod<bool>(
      'setNotifyValue',
      request.toMap(),
    );

    return result!;
  }

  @override
  Future<void> setOptions(
    Options options,
  ) async {
    await _channel.invokeMethod<void>(
      'setOptions',
      options.toMap(),
    );
  }

  @override
  Future<void> setPreferredPhy(
    BmPreferredPhy preferredPhy,
  ) async {
    await _channel.invokeMethod<void>(
      'setPreferredPhy',
      preferredPhy.toMap(),
    );
  }

  @override
  Future<void> startScan(
    BmScanSettings settings,
  ) async {
    await _channel.invokeMethod<void>(
      'startScan',
      settings.toMap(),
    );
  }

  @override
  Future<void> stopScan() async {
    await _channel.invokeMethod<void>(
      'stopScan',
    );
  }

  @override
  Future<void> turnOff() async {
    await _channel.invokeMethod<void>(
      'turnOff',
    );
  }

  @override
  Future<bool> turnOn() async {
    final result = await _channel.invokeMethod<bool>(
      'turnOn',
    );

    return result!;
  }

  @override
  Future<void> writeCharacteristic(
    BmWriteCharacteristicRequest request,
  ) async {
    await _channel.invokeMethod<void>(
      'writeCharacteristic',
      request.toMap(),
    );
  }

  @override
  Future<void> writeDescriptor(
    BmWriteDescriptorRequest request,
  ) async {
    await _channel.invokeMethod<void>(
      'writeDescriptor',
      request.toMap(),
    );
  }
}
