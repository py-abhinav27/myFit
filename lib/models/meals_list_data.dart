class MealsListData {
  String imagePath;
  String title;
  String startColor;
  String endColor;
  List<String> meals;
  int kcal;

  MealsListData({
    this.imagePath = '',
    this.title = '',
    this.startColor = '',
    this.endColor = '',
    required this.meals,
    this.kcal = 0,
  });

  static List<MealsListData> tabIconsList = [
    MealsListData(
      imagePath: 'lib/assets/images/breakfast.png',
      title: 'Breakfast',
      startColor: '#FA7D82',
      endColor: '#FFB295',
      kcal: 525,
      meals: ['Bread', 'Peanut butter', 'Apple'],
    ),
    MealsListData(
      imagePath: 'lib/assets/images/lunch.png',
      title: 'Lunch',
      startColor: '#738AE6',
      endColor: '#5C5EDD',
      kcal: 602,
      meals: ['Salmon', 'Mixed veggies', 'Avocado'],
    ),
    MealsListData(
      imagePath: 'lib/assets/images/snack.png',
      title: 'Snack',
      startColor: '#FE95B6',
      endColor: '#FF5287',
      kcal: 0,
      meals: ['Recommend', '800 kcal'],
    ),
    MealsListData(
      imagePath: 'lib/assets/images/dinner.png',
      title: 'Dinner',
      startColor: '#6F72CA',
      endColor: '#1E1466',
      kcal: 0,
      meals: ['Recommend', '703 kcal'],
    ),
  ];
}
