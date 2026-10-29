import '../../domain/repositories/onboarding_repository.dart';
import '../datasources/local_prefs_datasource.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  OnboardingRepositoryImpl(this._dataSource);

  final LocalPrefsDataSource _dataSource;

  @override
  bool isOnboardingComplete() => _dataSource.getOnboardingComplete();

  @override
  Future<void> setOnboardingComplete() => _dataSource.setOnboardingComplete();
}
