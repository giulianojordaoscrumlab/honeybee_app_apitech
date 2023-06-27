// ignore_for_file: constant_identifier_names

import 'package:honeybee/const/enums.dart';

class Env {
  static const String TITLE = "Honey Bee";

  static const String urlBase =
      "http://backend.honeybee.scrumlab.dev.br/api/v1";
  //"http://localhost:4002/api/v1";

  // : "http://honeybee.scrumlab.dev.br:4002/api/v1";

  // static const String urlStorage = "http://honeybee.scrumlab.dev.br:4002/";
  static const String urlStorage = "http://backend.honeybee.scrumlab.dev.br/";

  static const String audiosPath = "journal/audios/";
  static const String videosPath = "journal/videos/";
  static const String ImagePath = "journal/pictures/";

  static const PlanType planType = PlanType.free; //! "FREE|BRONZE|OURO|PRATA"
  static const bool freePlan = true;
  static const String api_key =
      "1WfK4Lmn1eN8B0CCBUgdOWiP4xrmGGakVhSSdVxfWdg3PA78OBe1uuFhjIWQYnITopfZeWQA69V790KzTqniWXvXHX1JcWkp43hVENEpIM4M0Ey1SrnQLEtA0Iy3eqak3KXu0HfPLKG1A4rejQggkp0mvEZXdrApzg8tFJOPG9qLqO8Cl98PZcBqn3gGJZdpMWADQe8UVu139rIHtcGgXjwOzEoGDVQUBruheueSNJlHXvJcGoOhFff21uEcabAyGjGyxUvbassIDInKAlnGaxMg5qhwSjs9MC5vb6upGEPoo89s3aYXcvmxZBqPdhZhEf21wHa3kVnJx4nojWkKcyV15f4EGrEZzmm1KA1s3uACSj9zzWLr6q0lbJA5itzJHf0FqhU7Y8H9Z1s02NBgjnwb7bGbs71ITHavKQeLp5USp3YL2tHoj1PU1lggyWt7fb32MGOJqI8iat245S1QecD2P7sep8c5Z0fIRsGASO4GLl2hxKKQvZOW60QikWPO";
  static const String api_secret = "9cbcfc9d-dae0-485e-8c67-bead3594bf5b";

//! endpoint login
  static const String methodPostLogin = "/users/login";
  static const String methodValidateUser = "/users/validateUser";
  static const String methodGetLogout = "/users/logout";

//* Account Suspension and Cancelation
  static const String methodPostAccountCancelation =
      "/users/accountCancelation";
  static const String methodPostAccountSuspension = "/users/accountSuspension";

//* Password change
  static const String methodPostChangePassword = "/users/changePassword";

//* Password forgot
  static const String methodPostPasswordRecoverCodeGeneration =
      "/users/recoryCode";
  static const String methodPostPasswordRecoveryByCode = "/users/recoryByCode";

//! endpoint getNewsHome
  static const String methodPostFetchAllApiaries = "/apiaries/findAll";

//! endpoint getVideosPageData
  static const String methodPostFetchAllVideos = "/system/getAllYtslVideos";

//! endpoint getFightsHome
  static const String methodPostFetchAllFights = "/fights/findAll";
  static const String methodPostFetchNextFight = "/fights/findFilter";

//! endpoint getFightersHome
  static const String methodPostFetchAllFighters = "/fighters/findAll";
  static const String methodPostFetchNextFighert = "/fighters/findFilter";

//! endpoint createUser
  static const String methodPostCreateUser = "/users/create";

//! endpoint get Terms
  static const String methodGetTerms = "/system/terms";
  static const String methodGetPrivacy = "/system/privacy";

//! endpoint editUser
  static const String methodPatchEditUser = "/users/update";

//! endpoint forgotPassword
  static const String methodPostRecoveryPassword = "/users/recoveryCode";
  static const String methodPostLostPassword = "/users/lostPassword";
  static const String methodGetValidateUser = "/users/validateUser";

//! enpoints system
  static const String methodGetPoliticsPrivacy = "/system/getPrivacyPolitics";
  static const String methodGetTermsOfUse = "/system/getThermsAndConditions";

//! urls Scrumlab Social Medias
  static const String urlInstagramScrumlabNative =
      "instagram://user?username=scrum.lab_";
  static const String urlFacebookScrumlabNative = "facebook://user?scrumlab";
  static const String urlLinkedinScrumlabNative = "linkedin://user?scrumlab";

  static const String urlInstagramScrumlab =
      "https://www.instagram.com/scrum.lab_";
  static const String urlFacebookScrumlab = "https://www.facebook.com/scrumlab";
  static const String urlLinkedinScrumlab =
      "https://www.linkedin.com/in/scrumlab";
}
