final class ApiEndpoints {
  static const login = "api/auth/login/";
  static const register = "api/auth/register/";
  static const refresh = "api/auth/refresh/";
  static const apply = "api/jobs/apply/";
  static const joblist = "api/jobs/list/";
  static const seekerApplications = "api/jobs/seeker/applications/";
  static const empoyerJobs = "api/jobs/employer/jobs/";
  static const profile = "api/auth/profile/";
  static String employerApplicaitons(int jobId) =>
      "api/jobs/employer/applications/$jobId/";
  // static String verse(int chapterId) => "$chapter$chapterId/verses/";
  // static String particularVerse(int chapterId, int verseId) =>
  //     "${verse(chapterId)}$verseId/";
}
