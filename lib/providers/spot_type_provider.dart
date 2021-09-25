import 'dart:async';
import 'dart:convert';
import 'package:nowrth/models/classes/spot_type.dart';

import 'package:nowrth/providers/api_provider.dart';
import 'package:nowrth/utils/http_exception.dart';

// class ContributionProvider with ChangeNotifier {
class SpotTypesProvider {
  ApiProvider apiProvider = ApiProvider();

  Future<List<SpotType>> getSpotTypes() async {
    String endpoint = 'GetAll';

    try {
      final url = 'SpotType/$endpoint';

      final response = await apiProvider.get(url: url);

      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }

      List responseList = responseData['data'];
      List<SpotType> spotTypes = List<SpotType>.generate(
        responseList.length,
        (i) => SpotType(
          id: responseList[i]['id'],
          name: responseList[i]['name'],
        ),
      );
      return spotTypes;
    } catch (e) {
      rethrow;
    }
  }
}
