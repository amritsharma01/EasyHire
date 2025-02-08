import 'package:easyhire_app/core/extensions/int.dart';
import 'package:easyhire_app/core/extensions/padding.dart';
import 'package:easyhire_app/features/employerapp/presentation/providers/emp_dependency_providers.dart';
import 'package:easyhire_app/features/user/presentation/provider/user_dependency_providers.dart';
import 'package:easyhire_app/features/user/presentation/widgets/filter.dart';
import 'package:easyhire_app/features/jobseekerapp/presentation/widgets/job_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/get.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../auth/presentation/widgets/buttonWidgets/appicon.dart';
import '../../../auth/presentation/widgets/formWidget/form_field.dart';
import '../../../auth/presentation/widgets/specialWidgets/progress_indicator.dart';
import '../../../auth/presentation/widgets/textWidgets/app_text.dart';
import '../../../jobseekerapp/presentation/providers/jobs_dependency_provider.dart';

import '../provider/search_provider.dart';

class SearchView extends ConsumerStatefulWidget {
  const SearchView({super.key});

  @override
  ConsumerState<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends ConsumerState<SearchView> {
  @override
  Widget build(BuildContext context) {
    final searchQuery = ref.watch(searchQueryProvider);
    final filterData = ref.watch(filterProvider);
    final fetchJoblist = ref.watch(filteredJobNotifierProvider);
    final empfetchJobList = ref.watch(filteredEmpjobNotifierProvider);
    final userRole = ref.read(userNotifierProvider).value;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0).rt,
          child: Row(
            children: [
              AppIcon(
                AppIcons.back,
                color: Get.primaryColor,
                size: 24,
                onTap: () {
                  userRole!.isJobseeker
                      ? ref.invalidate(filteredJobNotifierProvider)
                      : ref.invalidate(filteredEmpjobNotifierProvider);
                  Get.pop();
                },
                padding: EdgeInsets.only(bottom: 10).rt,
              ),
              10.horizontalGap,
              Expanded(
                child: AppTextFormField(
                  isDense: true,
                  contentPadding: const EdgeInsets.all(10).rt,
                  hintText: "Search jobs...",
                  radius: 55,
                  suffixIcon: AppIcon(
                    AppIcons.clear,
                    onTap: () {
                      ref.read(searchQueryProvider.notifier).state = "";
                    },
                    padding: const EdgeInsets.only(right: 5).rt,
                  ),
                  onChanged: (value) {
                    ref.read(searchQueryProvider.notifier).state = value;
                  },
                ),
              ),
            ],
          ),
        ),
        actions: [
          userRole!.isJobseeker
              ? AppIcon(
                  AppIcons.filter,
                  color: Get.primaryColor,
                  onTap: () {
                    applyFilter(ref);
                  },
                )
              : SizedBox.shrink()
        ],
      ),
      body: userRole.isEmployer
          ? empfetchJobList.when(
              loading: () => const Center(child: AppProgressIndicator()),
              error: (error, stackTrace) => Center(
                  child: AppText("Error loading jobs, try again later!")),
              data: (jobList) {
                final filteredJobs = jobList.where((job) {
                  final matchesQuery = job!.title
                          .toLowerCase()
                          .contains(searchQuery.toLowerCase()) ||
                      job.description
                          .toLowerCase()
                          .contains(searchQuery.toLowerCase());

                  return matchesQuery;
                }).toList();

                return filteredJobs.isEmpty
                    ? Center(
                        child: AppText("No jobs found, use different keywords"))
                    : ListView.builder(
                        itemCount: filteredJobs.length,
                        itemBuilder: (context, index) {
                          return JobCard(filteredJobs[index]!);
                        },
                      );
              },
            )
          : fetchJoblist.when(
              loading: () => const Center(child: AppProgressIndicator()),
              error: (error, stackTrace) => Center(
                  child: AppText("Error loading jobs, try again later!")),
              data: (jobList) {
                final filteredJobs = jobList.where((job) {
                  final matchesQuery = job!.title
                          .toLowerCase()
                          .contains(searchQuery.toLowerCase()) ||
                      job.description
                          .toLowerCase()
                          .contains(searchQuery.toLowerCase());

                  final matchesLocation = filterData["location"] == null ||
                      job.location.toLowerCase().contains(
                          filterData["location"].toString().toLowerCase());

                  final matchesSalary = filterData["salary"] == null ||
                      (job.salary
                          .toString()
                          .contains(filterData["salary"].toString()));

                  return matchesQuery && matchesLocation && matchesSalary;
                }).toList();

                return filteredJobs.isEmpty
                    ? Center(
                        child: AppText("No jobs found, use different keywords"))
                    : ListView.builder(
                        itemCount: filteredJobs.length,
                        itemBuilder: (context, index) {
                          return JobCard(filteredJobs[index]!);
                        },
                      );
              },
            ),
    );
  }
}
