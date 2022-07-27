import 'package:bloc_stack_meeting/core/data/repositories/repository_impl.dart';
import 'package:bloc_stack_meeting/core/domain/repositories/repository.dart';
import 'package:bloc_stack_meeting/core/handlers/result/result.dart';
import 'package:bloc_stack_meeting/features/home/bloc/home_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final repoStub = RepositoryStub();

  var sut = HomeBloc();
  sut.repo = repoStub;
  var state = sut.state;

  tearDown(() => sut.close());

  group('Event FetchHomeList', () {
    test("bloc started", () {
      expect(state, HomeInitial());
    });

    blocTest(
      'everything went fine, expects 2 states',
      setUp: () {
        sut = HomeBloc();
        sut.repo = repoStub;
      },
      tearDown: () {
        sut.close();
      },
      build: () => sut,
      act: (HomeBloc bloc) => bloc.add(FetchHomeList()),
      expect: () => [
        const HomeLoading(),
        const HomeList(homeList: ["dummy1", "dummy2"])
      ],
    );

    blocTest(
      'something went wrong, expects 1 error and 1 loading state',
      setUp: () {
        repoStub.hasError = true;
        sut = HomeBloc();
        sut.repo = repoStub;
      },
      tearDown: () {
        sut.close();
      },
      build: () => sut,
      act: (HomeBloc bloc) => bloc.add(FetchHomeList()),
      expect: () =>
          [const HomeLoading(), const HomeError(error: "Server error!")],
    );
  });
}

class RepositoryStub extends RepositoryImpl implements Repository {
  bool hasError = false;

  @override
  Future<Result<String, List<String>>> fetchHomeList() async {
    return hasError
        ? Result(error: "Server error!")
        : Result(data: ["dummy1", "dummy2"]);
  }
}
