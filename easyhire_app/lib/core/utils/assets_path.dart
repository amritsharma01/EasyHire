//Centralization of Assets

class _AssetsImagesGen {
  const _AssetsImagesGen();
  static const _imagePath = "${Assets._basePath}/images";

  String get splashImage => "$_imagePath/";
  // String get onboardingBg => "$_imagePath/onboarding_bg.svg";
  // String get quotesBackground => "$_imagePath/bhagwatgita_cover.jpg";
  // String onbordingImage(index) => "$_imagePath/onboarding_image$index.png";
  // String get chapterFlower => "$_imagePath/chapter_flower.png";
  // String get krishnaBackground => "$_imagePath/krishna_background.png";
}

class _AssetsSvgIconGen {
  const _AssetsSvgIconGen();
  static const _iconPath = "${Assets._basePath}/icons";
  String get settings => "$_iconPath/";
}

class Assets {
  Assets._();
  static const _basePath = "assets";
  static const images = _AssetsImagesGen();
  static const icons = _AssetsSvgIconGen();
}
