import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:nowrth/models/classes/spot_location.dart';
import 'package:nowrth/models/classes/spot_type.dart';

import 'package:nowrth/models/classes/contribution.dart';
import 'package:nowrth/providers/api_provider.dart';
import 'package:nowrth/utils/http_exception.dart';
import 'package:nowrth/utils/image_utils.dart';

// class ContributionProvider with ChangeNotifier {
abstract class ContributionProvider {
  static final ApiProvider apiProvider = ApiProvider();
  static const String initUrl = 'contribution/';

  static Future<ContributionListItem> addContributionRequest({
    required String name,
    required SpotType spotType,
    required Coordinates coordinates,
    required String description,
    required List<String> imageBase64s,
  }) async {
    try {
      String endpoint = 'create';

      final url = initUrl + endpoint;

      final response = await apiProvider.post(
        url: url,
        body: {
          'name': name,
          'spotTypeId': spotType.id,
          'latitude': coordinates.latitude,
          'longitude': coordinates.longitude,
          'description': description,
          'images': imageBase64s,
        },
      );

      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }

      int _id = responseData['data']['id'];
      Address _address = responseData['data']['address'];
      int _statusIconCode = responseData['data']['statusIconCode'];
      int _spotTypeIconCode = responseData['data']['spotTypeIconCode'];

      /*
        // _expiryDate = DateTime.now()
        // .add(Duration(seconds: int.parse(responseData['expiresIn'])));
        // notifyListeners();
      */

      return ContributionListItem(
        id: _id,
        name: name,
        address: _address,
        thumbnail: ImageUtils.base64ToImg(imageBase64s[0]),
        statusIconCode: _statusIconCode,
        spotTypeIconCode: _spotTypeIconCode,
      );
    } catch (e) {
      rethrow;
    }
  }

  static Future<ContributionListItem> updateContributionRequest({
    required Contribution contribution,
    required List<String> imageBase64s,
  }) async {
    String endpoint = 'update';

    try {
      final url = initUrl + endpoint;

      final response = await apiProvider.post(
        url: url,
        body: {
          'id': contribution.id,
          'name': contribution.name,
          'spotType': contribution.spotType,
          'latitude': contribution.coordinates.latitude,
          'longitude': contribution.coordinates.longitude,
          'description': contribution.description,
          'images': imageBase64s,
        },
      );

      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }

      Address _address = responseData['data']['address'];
      int _statusIconCode = responseData['data']['statusIconCode'];
      int _spotTypeIconCode = responseData['data']['spotTypeIconCode'];

      /*
        // _expiryDate = DateTime.now()
        // .add(Duration(seconds: int.parse(responseData['expiresIn'])));
        // notifyListeners();
      */

      return ContributionListItem(
        id: contribution.id,
        name: contribution.name,
        address: _address,
        thumbnail: ImageUtils.base64ToImg(imageBase64s[0]),
        statusIconCode: _statusIconCode,
        spotTypeIconCode: _spotTypeIconCode,
      );
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<ContributionListItem>> getContributionListItems() async {
    String endpoint = 'create';
    try {
      final url = initUrl + endpoint;
      final response = await apiProvider.get(
        url: url,
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }

      List responseList = responseData['data'];

      return List<ContributionListItem>.generate(
        responseList.length,
        (i) => ContributionListItem(
          id: responseList[i]['id'],
          name: responseList[i]['name'],
          address: responseList[i]['address'],
          statusIconCode: responseList[i]['statusIconCode'],
          thumbnail: ImageUtils.base64ToImg(responseList[i]['thumbnail']),
          spotTypeIconCode: responseList[i]['spotTypeIconCode'],
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  static Future<Contribution> getContribution({required int id}) async {
    String endpoint = 'get';

    try {
      final url = initUrl + endpoint + '?id=$id';

      final response = await apiProvider.get(
        url: url,
      );

      final responseBody = json.decode(response.body);
      if (responseBody['error'] != null) {
        throw HttpException(responseBody['error']['message']);
      }

      /*
          // _expiryDate = DateTime.now()
          // .add(Duration(seconds: int.parse(responseData['expiresIn'])));
          // notifyListeners();
        */

      final responseData = responseBody['data'];
      final spotType = responseData['spotType'];
      final coordinates = responseData['coordinates'];

      String _name = responseData['name'];
      SpotType _spotType = SpotType(
        id: spotType['id'],
        name: spotType['name'],
      );
      Coordinates _coordinates = Coordinates(
        latitude: coordinates['latitude'],
        longitude: coordinates[' longitude'],
      );
      String _description = responseData['description'];
      List<String> _imageBase64s = responseData['images'];
      int _statusIconCode = responseData['statusIconCode'];
      int _spotTypeIconCode = spotType['spotTypeIconCode'];

      return Contribution(
        id: id,
        name: _name,
        spotType: _spotType,
        coordinates: _coordinates,
        description: _description,
        imageBase64s: _imageBase64s,
        statusIconCode: _statusIconCode,
        spotTypeIconCode: _spotTypeIconCode,
      );
    } catch (e) {
      rethrow;
    }
  }
}
