import 'package:app_bloc/core/use_cases/base_use_cases.dart';
import 'package:app_bloc/domain/dto/login_dto.dart';

import '../entities/login_response.dart';

class LoginUseCase extends UseCase<LoginResponse, LoginDto> {
  @override
  Future<LoginResponse> execute({LoginDto? params}) {
    throw UnimplementedError();
  }
}
