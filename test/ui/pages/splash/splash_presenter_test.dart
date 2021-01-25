import 'package:boticario_news/ui/helpers/user_session.dart';
import 'package:faker/faker.dart';
import 'package:boticario_news/domain/entities/account_entity.dart';
import 'package:boticario_news/domain/usecases/load_current_account.dart';
import 'package:boticario_news/main/pages/app_pages.dart';
import 'package:boticario_news/ui/pages/splash/splash_presenter.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class LoadCurrentAccountSpy extends Mock implements LoadCurrentAccount {}

class UserSessionSpy extends Mock implements UserSession {}

void main() {
  SplashPresenter sut;
  LoadCurrentAccountSpy loadCurrentAccount;
  UserSessionSpy userSession;

  setUp(() {
    loadCurrentAccount = LoadCurrentAccountSpy();
    userSession = UserSessionSpy();

    sut = SplashPresenter(
      loadCurrentAccount: loadCurrentAccount,
      userSession: userSession,
    );
  });

  test('Should call LoadCurrentAccount', () async {
    await sut.checkAccount(test: true);

    verify(loadCurrentAccount.load()).called(1);
  });

  test('Should go to FeedPage if has token', () async {
    when(loadCurrentAccount.load()).thenAnswer(
      (_) async => AccountEntity(
          token: faker.guid.guid(),
          username: faker.person.name(),
          id: faker.randomGenerator.integer(2)),
    );

    await sut.checkAccount(test: true);

    expect(sut.navigateTo, AppPages.feed);
  });

  test('Should go to WelcomePage if not token', () async {
    when(loadCurrentAccount.load()).thenAnswer((_) async => AccountEntity(
          token: null,
          username: null,
          id: null,
        ));

    await sut.checkAccount(test: true);

    expect(sut.navigateTo, AppPages.welcome);
  });

  test('Should go to WelcomePage if throws', () async {
    when(loadCurrentAccount.load()).thenThrow(Exception());

    await sut.checkAccount(test: true);

    expect(sut.navigateTo, AppPages.welcome);
  });
}
