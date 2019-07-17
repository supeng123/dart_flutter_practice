import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();

  class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String categoryTitle;
  List<Meal>displayMeals;
  bool _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String,String>;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    displayMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    

    super.didChangeDependencies()
  }

  void _removeMeal(String mealId) {
    setState(() {

      displayMeals.removeWhere((meal) => {
        meal.id == mealId;
      })
    })
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index){
          return MealItem(
            displayMeals[index].id,
            displayMeals[index].title,
            displayMeals[index].imageUrl,
            displayMeals[index].duration,
            displayMeals[index].complexity,
            displayMeals[index].affordability,
            removeItem: _removeMeal
            );
        },
        itemCount: displayMeals.length,
      ),
    );
  }
}