import 'package:vexana/vexana.dart';

final class LoginService {
  LoginService({required INetworkManager<EmptyModel> networkManager})
      : _networkManager = networkManager;

  final INetworkManager<EmptyModel> _networkManager;

  // Future<List<int>> user(){
  //   final response = await _networkManager.send<int, List<int>>(
  //     ProductServicePath.users.value,
  //     parseModel: int(),
  //     method: RequestType.GET,
  //   );
  //   return response;
  // }
}
