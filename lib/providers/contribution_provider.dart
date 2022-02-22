import 'dart:async';
import 'dart:convert';
import 'package:nowrth/models/classes/spot_location.dart';
import 'package:nowrth/models/classes/spot_type.dart';

import 'package:nowrth/models/classes/contribution.dart';
import 'package:nowrth/providers/api_provider.dart';
import 'package:nowrth/utils/http_exception.dart';
import 'package:nowrth/utils/image_utils.dart';

// class ContributionProvider with ChangeNotifier {
abstract class ContributionProvider {
  static const String _initUrl = 'contribution/';
  static const String _data_ = 'data';
  static const String _id_ = 'id';
  static const String _name_ = 'name';
  static const String _iconCode_ = 'iconCode';
  static const String _address_ = 'address';
  static const String _description_ = 'description';
  static const String _images_ = 'images';
  static const String _thumbnail_ = 'thumbnail';

  static const String _spotTypeId_ = 'spotTypeId';
  static const String _spotType_ = 'spotType';
  static const String _coordinates_ = 'coordinates';
  static const String _latitude_ = 'latitude';
  static const String _longitude_ = 'longitude';

  static const String _spotTypeIconCode_ = 'spotTypeIconCode';
  static const String _statusIconCode_ = 'statusIconCode';
  static const String _error_ = 'error';
  static const String _message_ = 'message';

  static Future<ContributionListItem> addContributionRequest({
    required String name,
    required SpotType spotType,
    required Coordinates coordinates,
    required Address address,
    required String description,
    required List<String> imageBase64s,
  }) async {
    try {
      String endpoint = 'create';

      final url = _initUrl + endpoint;

      final response = await ApiProvider.post(
        url: url,
        body: {
          _name_: name,
          _spotTypeId_: spotType.id,
          _latitude_: coordinates.latitude,
          _longitude_: coordinates.longitude,
          _address_: address.fullAddress,
          _description_: description,
          _images_: imageBase64s,
        },
      );

      final responseBody = json.decode(response.body);
      if (responseBody[_error_] != null) {
        throw HttpException(responseBody[_error_][_message_]);
      }

      int _id = responseBody[_data_];
      // int _statusIconCode = responseData[_data][_statusIconCode_];

      /*
        // _expiryDate = DateTime.now()
        // .add(Duration(seconds: int.parse(responseData['expiresIn'])));
        // notifyListeners();
      */

      return ContributionListItem(
        id: _id,
        name: name,
        address: address,
        thumbnail: ImageUtils.base64ToImg(imageBase64s[0]),
        spotTypeIconCode: spotType.iconCode,
        statusIconCode: 58927,
      );
    } catch (e) {
      rethrow;
    }
  }

  static Future<ContributionListItem> updateContributionRequest({
    required Contribution contribution,
  }) async {
    try {
      String endpoint = 'update';

      final url = _initUrl + endpoint;

      final response = await ApiProvider.put(
        url: url,
        body: {
          _id_: contribution.id,
          _name_: contribution.name,
          _spotTypeId_: contribution.spotType.id,
          _latitude_: contribution.coordinates.latitude,
          _longitude_: contribution.coordinates.longitude,
          _address_: contribution.address.fullAddress,
          _description_: contribution.description,
          _images_: contribution.imageBase64s,
        },
      );

      final responseBody = json.decode(response.body);
      if (responseBody[_error_] != null) {
        throw HttpException(responseBody[_error_][_message_]);
      }

      // int _statusIconCode = responseBody[_data_][_statusIconCode_];
      /*
        // _expiryDate = DateTime.now()
        // .add(Duration(seconds: int.parse(responseData['expiresIn'])));
        // notifyListeners();
      */

      return ContributionListItem.fromContribution(
        contribution: contribution,
        newStatusIconCode: 61533,
      );
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<ContributionListItem>> getContributionListItems() async {
    String endpoint = 'GetAll';
    try {
      final url = _initUrl + endpoint;
      final response = await ApiProvider.get(url: url);
      final responseBody = json.decode(response.body);
      if (responseBody[_error_] != null) {
        throw HttpException(responseBody[_error_][_message_]);
      }

      List responseData = responseBody[_data_];

      return List<ContributionListItem>.generate(
        responseData.length,
        (i) {
          final String address = responseData[i][_address_];
          final int firstCommaIndex = address.indexOf(', ');

          return ContributionListItem(
            id: responseData[i][_id_],
            name: responseData[i][_name_],
            address: Address(
              cityOrTown: address.substring(0, firstCommaIndex),
              country: address.substring(firstCommaIndex + 2),
            ),
            thumbnail: ImageUtils.base64ToImg(responseData[i][_thumbnail_]),
            spotTypeIconCode: responseData[i][_spotTypeIconCode_],
            statusIconCode: responseData[i][_statusIconCode_],
          );
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  static Future<Contribution> getContribution({required int id}) async {
    String endpoint = 'get';

    try {
      final url = _initUrl + endpoint + '?id=$id';

      final response = await ApiProvider.get(url: url);

      final responseBody = json.decode(response.body);
      if (responseBody[_error_] != null) {
        throw HttpException(responseBody[_error_][_message_]);
      }

      /*
          // _expiryDate = DateTime.now()
          // .add(Duration(seconds: int.parse(responseData['expiresIn'])));
          // notifyListeners();
        */

      final responseData = responseBody[_data_];
      final spotType = responseData[_spotType_];
      final coordinates = responseData[_coordinates_];
      final String address = responseData[_address_];
      final int firstCommaIndex = address.indexOf(', ');

      String _name = responseData[_name_];
      SpotType _spotType = SpotType(
        id: spotType[_id_],
        name: spotType[_name_],
        iconCode: spotType[_iconCode_],
      );
      Coordinates _coordinates = Coordinates(
        latitude: coordinates[_latitude_].toDouble(),
        longitude: coordinates[_longitude_].toDouble(),
      );
      Address _address = Address(
        cityOrTown: address.substring(0, firstCommaIndex),
        country: address.substring(firstCommaIndex + 2),
      );
      String _description = responseData[_description_];
      List _imageBase64s = responseData[_images_];

      return Contribution(
        id: id,
        name: _name,
        spotType: _spotType,
        coordinates: _coordinates,
        address: _address,
        description: _description,
        imageBase64s: _imageBase64s.cast<String>(),
      );
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool?> deleteContribution({required int id}) async {
    String endpoint = 'delete';

    try {
      final url = _initUrl + endpoint + '?id=$id';

      final response = await ApiProvider.delete(url: url);

      final responseBody = json.decode(response.body);
      if (responseBody[_error_] != null) {
        throw HttpException(responseBody[_error_][_message_]);
      }

      /*
        // _expiryDate = DateTime.now()
        // .add(Duration(seconds: int.parse(responseData['expiresIn'])));
        // notifyListeners();
      */
      // final responseData = responseBody[_data_];
    } catch (e) {
      rethrow;
    }

    return true; //TODO: make sure this is correct
  }
}
