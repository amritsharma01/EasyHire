import 'package:easyhire_app/features/employerapp/data/repository/received_appl_repo_impl.dart';
import 'package:easyhire_app/features/employerapp/domain/entities/application_entity.dart';
import 'package:easyhire_app/features/employerapp/domain/repositories/received_appl_repo.dart';
import 'package:easyhire_app/features/employerapp/domain/usecases/emp_job_usecase.dart';
import 'package:easyhire_app/features/employerapp/domain/usecases/received_appn_usecase.dart';
import 'package:easyhire_app/features/employerapp/presentation/providers/emp_jobs_notifier.dart';
import 'package:easyhire_app/features/employerapp/presentation/providers/received_appn_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/core_service_providers.dart';
import '../../../jobseekerapp/domain/entity/job_entity.dart';
import '../../data/datasource/emp_jobs_remte_datasource.dart';
import '../../data/repository/employer_jobs_repo_impl.dart';
import '../../domain/repositories/emp_job_repo.dart';

///dependencies for fetching joblist//////

final empjobRemoteDataSourceProvider = Provider<EmpJobsRemoteDatasource>((ref) {
  final apiProvider = ref.watch(apiServiceProvider);
  return EmpJobsRemoteDatasource(apiProvider);
});

final empjobRepoProvider = Provider<EmpJobRepo>((ref) {
  final jobDatasource = ref.read(empjobRemoteDataSourceProvider);
  return EmpJobRepoImpl(jobDatasource);
});

final jobUsecaseProvider = Provider<EmpJobUsecase>((ref) {
  final empjobrepoProvider = ref.read(empjobRepoProvider);
  return EmpJobUsecase(empjobrepoProvider);
});

final empjobNotifierProvider =
    StateNotifierProvider<EmpJobStateNotifier, AsyncValue<List<JobEntity?>>>(
        (ref) {
  final empjobUsecase = ref.read(jobUsecaseProvider);
  return EmpJobStateNotifier(empjobUsecase);
});

////dependencies for fetching all applications for particular job

final receivedApplRepoProvider = Provider<ReceivedApplRepo>((ref) {
  return ReceivedApplRepoImpl(ref.read(empjobRemoteDataSourceProvider));
});

final receivedAppnUsecaseProvider = Provider<ReceivedAppnUsecase>((ref) {
  return ReceivedAppnUsecase(ref.read(receivedApplRepoProvider));
});

final receivedAppnNotifierProvicer = StateNotifierProvider<ReceivedAppnNotifier,
    AsyncValue<List<ApplicationEntity?>>>((ref) {
  return ReceivedAppnNotifier(ref.read(receivedAppnUsecaseProvider));
});
