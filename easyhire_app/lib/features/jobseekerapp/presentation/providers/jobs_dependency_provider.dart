import 'package:easyhire_app/features/jobseekerapp/data/datasource/jobs_remote_datasource.dart';
import 'package:easyhire_app/features/jobseekerapp/data/repository/applied_jobs_repo_impl.dart';
import 'package:easyhire_app/features/jobseekerapp/data/repository/job_repo_impl.dart';
import 'package:easyhire_app/features/jobseekerapp/domain/entity/applied_job_entity.dart';
import 'package:easyhire_app/features/jobseekerapp/domain/entity/job_entity.dart';
import 'package:easyhire_app/features/jobseekerapp/domain/repository/applied_jobs_repo.dart';
import 'package:easyhire_app/features/jobseekerapp/domain/repository/job_apply_repo.dart';
import 'package:easyhire_app/features/jobseekerapp/domain/repository/job_repo.dart';
import 'package:easyhire_app/features/jobseekerapp/domain/usecase/applied_jobs_usecase.dart';
import 'package:easyhire_app/features/jobseekerapp/domain/usecase/fetch_job_usecase.dart';
import 'package:easyhire_app/features/jobseekerapp/presentation/providers/applied_jobs_notifier.dart';
import 'package:easyhire_app/features/jobseekerapp/presentation/providers/bookmark_notifier.dart';
import 'package:easyhire_app/features/jobseekerapp/presentation/providers/job_apply_notifier.dart';
import 'package:easyhire_app/features/jobseekerapp/presentation/providers/jobs_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/core_service_providers.dart';
import '../../data/repository/job_apply_repo_impl.dart';
import '../../domain/usecase/job_apply_usecase.dart';

///dependencies for fetching joblist//////

final jobRemoteDataSourceProvider = Provider<JobsRemoteDatasource>((ref) {
  final apiProvider = ref.watch(apiServiceProvider);
  return JobsRemoteDatasource(apiProvider);
});

final jobRepoProvider = Provider<JobRepo>((ref) {
  final jobDatasource = ref.read(jobRemoteDataSourceProvider);
  return JobRepoImpl(jobDatasource);
});

final jobUsecaseProvider = Provider<FetchJobUsecase>((ref) {
  final jobrepoProvider = ref.read(jobRepoProvider);
  return FetchJobUsecase(jobrepoProvider);
});

final jobNotifierProvider =
    StateNotifierProvider<JobStateNotifier, AsyncValue<List<JobEntity?>>>(
        (ref) {
  final jobUsecase = ref.read(jobUsecaseProvider);
  return JobStateNotifier(jobUsecase);
});

/////dependencies for applying a job///////
final jobApplyRepoProvider = Provider<JobApplyRepo>((ref) {
  final jobDatasource = ref.read(jobRemoteDataSourceProvider);
  return JobApplyRepoImpl(jobDatasource);
});

final jobApplyUsecaseProvider = Provider<JobApplyUsecase>((ref) {
  final jobapplyRepo = ref.read(jobApplyRepoProvider);
  return JobApplyUsecase(jobapplyRepo);
});

final jobApplyNotifierProvider =
    StateNotifierProvider<JobApplyNotifier, AsyncValue>((ref) {
  final applyUsecase = ref.read(jobApplyUsecaseProvider);
  return JobApplyNotifier(applyUsecase);
});

///bookmark provider
final bookmarkNotifierProvider = ChangeNotifierProvider(
    (ref) => BookmarkNotifier(ref.watch(storageServiceProvider)));

///applied jobs dependency providers

final appliedJobsRepoProviders = Provider<AppliedJobsRepo>((ref) {
  return AppliedJobsRepoImpl(ref.read(jobRemoteDataSourceProvider));
});

final appliedJobsUsecaseProvider = Provider<AppliedJobsUsecase>((ref) {
  return AppliedJobsUsecase(ref.read(appliedJobsRepoProviders));
});

final appliedjobsNotifierProvider = StateNotifierProvider<
    AppliedJobsStateNotifier, AsyncValue<List<AppliedJobEntity?>>>((ref) {
  return AppliedJobsStateNotifier(ref.read(appliedJobsUsecaseProvider));
});
