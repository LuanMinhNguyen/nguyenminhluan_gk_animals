import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

Random random = Random();
String gameLevel = "Easy";

var imgs = [
  '001-dog',
  '002-bird',
  '003-cat',
  '004-bee',
  '005-fish',
  '006-chicken',
  '007-animal',
  '008-animal-1',
  '009-camel',
  '010-animal-2',
  '011-cow',
  '012-halloween',
  '013-duck',
  '014-snake',
  '015-turkey',
  '016-frog'
];
var easy = List.filled(8, false);
var positionEasy = [0, 1, 2, 3, 0, 1, 2, 3];
var animalsEasy = List.filled(4, 0);

var medium = List.filled(12, false);
var positionMedium = [0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5];
var animalsMedium = List.filled(6, 0);

var hard = List.filled(24, false);
var positionHard = [
  0,
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  0,
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11
];
var animalsHard = List.filled(12, 0);

int counter = 3;
double counter_ = 0.5;
Timer? timer;

bool trigger = false;
int answer = 30;
int vitri = 30;
var checkedORback = ['images/017-checked.png', 'images/018-back.png'];
var changeEasy = List.filled(8, 'images/018-back.png');
var changeMedium = List.filled(12, 'images/018-back.png');
var changeHard = List.filled(24, 'images/018-back.png');
int score = 0;

final AudioCache audioCache = AudioCache();
