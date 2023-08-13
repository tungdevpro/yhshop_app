// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/base/app/app_bloc.dart' as _i3;
import '../core/utils/navigation/app_navigator.dart' as _i4;
import '../data/remote/provider/user_provider.dart' as _i9;
import '../data/remote/repository/user_repository.dart' as _i10;
import '../presentation/auth/bloc/auth_bloc.dart' as _i5;
import '../presentation/intro/cubit/intro_cubit.dart' as _i6;
import '../presentation/login/bloc/login_bloc.dart' as _i7;
import '../presentation/register/bloc/register_bloc.dart' as _i8;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.AppBloc>(_i3.AppBloc());
  gh.singleton<_i4.AppNavigator>(_i4.AppNavigator());
  gh.singleton<_i5.AuthBloc>(_i5.AuthBloc());
  gh.factory<_i6.IntroCubit>(() => _i6.IntroCubit());
  gh.factory<_i7.LoginBloc>(() => _i7.LoginBloc());
  gh.factory<_i8.RegisterBloc>(() => _i8.RegisterBloc());
  gh.lazySingleton<_i9.UserProvider>(() => _i9.UserProvider());
  gh.singleton<_i10.UserRepository>(
      _i10.UserRepository(gh<_i9.UserProvider>()));
  return getIt;
}
