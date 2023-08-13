import '/core/constants/difficulty.dart';
import '/core/models/duration.dart';
import '/features/search_recipe/data/models/difficulty_filter.dart';

const List<DifficultyFilter> difficulties = [
  DifficultyFilter(title: 'ساده', difficulty: Difficulty.easy),
  DifficultyFilter(title: 'متوسط', difficulty: Difficulty.medium),
  DifficultyFilter(title: 'سخت', difficulty: Difficulty.difficult),
  DifficultyFilter(title: 'نامشخص', difficulty: Difficulty.none),
];

final List<DurationFilter> durations = [
  const DurationFilter(
    title: '5 تا 25 دقیقه',
    minDuration: Duration(minutes: 5),
    maxDuration: Duration(minutes: 25),
  ),
  const DurationFilter(
    title: '25 دقیقه تا 1 ساعت',
    minDuration: Duration(minutes: 25),
    maxDuration: Duration(hours: 1),
  ),
  const DurationFilter(
    title: 'بیشتر از 1 ساعت',
    minDuration: Duration(hours: 1),
    maxDuration: Duration(hours: 5),
  ),
  const DurationFilter(
    title: 'نامشخص',
    minDuration: Duration(minutes: 0),
    maxDuration: Duration(minutes: 0),
  ),
];
