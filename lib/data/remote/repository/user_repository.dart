import 'package:app_bloc/core/network/failure.dart';
import 'package:app_bloc/data/models/user_model.dart';
import 'package:app_bloc/data/remote/provider/user_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class UserRepository implements IUserProvider {
  final UserProvider _userProvider;
  UserRepository(this._userProvider);

  @override
  Future<void> logOut() {
    return _userProvider.logOut();
  }

  @override
  Future<Either<Failure, UserModel>> login() {
    return _userProvider.login();
  }
}