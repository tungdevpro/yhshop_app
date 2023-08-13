import 'package:app_bloc/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/network/failure.dart';


abstract class IUserProvider {
  Future<void> logOut();

  Future<Either<Failure, UserModel>> login();
}

@LazySingleton()
class UserProvider implements IUserProvider {
  @override
  Future<void> logOut() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserModel>> login() {
    throw UnimplementedError();
  }
}