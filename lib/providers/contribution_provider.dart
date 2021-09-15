import 'dart:async';
import 'dart:convert';

// import 'package:flutter/widgets.dart';
import 'package:nowrth/models/classes/contribution.dart';
import 'package:nowrth/utils/http_exception.dart';

import 'api_provider.dart';

// class ContributionProvider with ChangeNotifier {
class ContributionProvider {
  ApiProvider apiProvider = ApiProvider();

  Future<void> addContributionRequest(Contribution contribution) async {
    String endpoint = 'create';
    try {
      final url = 'contribution/$endpoint';

      final response = await apiProvider.post(
        url: url,
        body: {
          "name": contribution.spotName,
          "spotType": contribution.spotTypeString,
          "latitude": contribution.latitude,
          "longitude": contribution.longitude,
          "description": contribution.description,
          "images": contribution.imagesBase64,
        },
      );

      if (response.body.isNotEmpty) {
        json.decode(response.body);

        final responseData = json.decode(response.body);
        if (responseData['error'] != null) {
          throw HttpException(responseData['error']['message']);
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
