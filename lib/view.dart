import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nguyenminhluan_gk_animals/model.dart';
import 'dart:math';

class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  void randomImgEasy() {
    var randomAnimals = [];
    Random random = new Random();
    while (randomAnimals.length < 4) {
      int random_number = random.nextInt(16);
      if (!randomAnimals.contains(random_number)) {
        randomAnimals.add(random_number);
      }
    }

    for (int i = 0; i < 4; i++) {
      animalsEasy[i] = randomAnimals[i];
    }
    positionEasy.shuffle();
  }

  void Easy_btnTap() {
    setState(() {
      gameLevel = "Easy";
    });
  }

  void randomImgMedium() {
    var randomAnimals = [];
    Random random = new Random();
    while (randomAnimals.length < 6) {
      int random_number = random.nextInt(16);

      if (!randomAnimals.contains(random_number)) {
        randomAnimals.add(random_number);
      }
    }

    for (int i = 0; i < 6; i++) {
      animalsMedium[i] = randomAnimals[i];
    }
    positionMedium.shuffle();
  }

  void Medium_btnTap() {
    setState(() {
      gameLevel = "Medium";
    });
  }

  void randomImgHard() {
    var randomAnimals = [];
    Random random = new Random();
    while (randomAnimals.length < 12) {
      int random_number = random.nextInt(16);

      if (!randomAnimals.contains(random_number)) {
        randomAnimals.add(random_number);
      }
    }

    for (int i = 0; i < 12; i++) {
      animalsHard[i] = randomAnimals[i];
    }
    positionHard.shuffle();
  }

  void Hard_btnTap() {
    setState(() {
      gameLevel = "Hard";
    });
  }

  void startGame() {
    setState(() {
      for (int i = 0; i < easy.length; i++) {
        easy[i] = true;
      }
      for (int i = 0; i < medium.length; i++) {
        medium[i] = true;
      }
      for (int i = 0; i < hard.length; i++) {
        hard[i] = true;
      }
      timer?.isActive;
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          if (counter > 0)
            counter--;
          else {
            timer.cancel();
            counter = 3;
            for (int i = 0; i < easy.length; i++) {
              easy[i] = false;
            }
            for (int i = 0; i < medium.length; i++) {
              medium[i] = false;
            }
            for (int i = 0; i < hard.length; i++) {
              hard[i] = false;
            }
          }
        });
      });
    });
  }

  void restartGame() {
    setState(() {
      for (int i = 0; i < easy.length; i++) {
        easy[i] = false;
      }
      for (int i = 0; i < medium.length; i++) {
        medium[i] = false;
      }
      for (int i = 0; i < hard.length; i++) {
        hard[i] = false;
      }
      changeEasy = List.filled(8, 'images/018-back.png');
      changeMedium = List.filled(12, 'images/018-back.png');
      changeHard = List.filled(24, 'images/018-back.png');
      score = 0;
    });
    initState();
  }

  void checkEasy(int num, String imgLink) {
    easy[num] = true;
    if (trigger == false) {
      trigger = true;
      answer = positionEasy[num];
      vitri = num;
    } else {
      if (answer == positionEasy[num]) {
        if (imgLink == 'images/001-dog.png') {
          audioCache.play('audios/dog.mp3');
        } else if (imgLink == 'images/002-bird.png') {
          audioCache.play('audios/bird.mp3');
        } else if (imgLink == 'images/003-cat.png') {
          audioCache.play('audios/cat.mp3');
        } else if (imgLink == 'images/004-bee.png') {
          audioCache.play('audios/bee.mp3');
        } else if (imgLink == 'images/005-fish.png') {
          audioCache.play('audios/fish.mp3');
        } else if (imgLink == 'images/006-chicken.png') {
          audioCache.play('audios/chicken.mp3');
        } else if (imgLink == 'images/009-camel.png') {
          audioCache.play('audios/camel.mp3');
        } else if (imgLink == 'images/011-cow.png') {
          audioCache.play('audios/cow.mp3');
        } else if (imgLink == 'images/012-halloween.png') {
          audioCache.play('audios/halloween.mp3');
        } else if (imgLink == 'images/013-duck.png') {
          audioCache.play('audios/duck.mp3');
        } else if (imgLink == 'images/014-snake.png') {
          audioCache.play('audios/snake.mp3');
        } else if (imgLink == 'images/015-turkey.png') {
          audioCache.play('audios/turkey.mp3');
        } else if (imgLink == 'images/016-frog.png') {
          audioCache.play('audios/frog.mp3');
        }
        timer?.isActive;
        timer = Timer.periodic(Duration(seconds: 1), (timer) {
          setState(() {
            if (counter_ > 0) {
              counter_--;
            } else {
              timer.cancel();
              counter_ = 0.5;
              easy[num] = false;
              easy[vitri] = false;
              changeEasy[num] = checkedORback[0];
              changeEasy[vitri] = checkedORback[0];
              score += 10;
            }
          });
        });
      } else {
        audioCache.play('audios/baby-laugh.mp3');
        timer?.isActive;
        timer = Timer.periodic(Duration(seconds: 1), (timer) {
          setState(() {
            if (counter_ > 0) {
              counter_--;
            } else {
              timer.cancel();
              counter_ = 0.5;
              score -= 5;
              for (int i = 0; i < easy.length; i++) {
                easy[i] = false;
              }
            }
          });
        });
      }
      (trigger = false);
      answer = 30;
    }
  }

  void checkMedium(int num, String imgLink) {
    medium[num] = true;
    if (trigger == false) {
      trigger = true;
      answer = positionMedium[num];
      vitri = num;
    } else {
      if (answer == positionMedium[num]) {
        if (imgLink == 'images/001-dog.png') {
          audioCache.play('audios/dog.mp3');
        } else if (imgLink == 'images/002-bird.png') {
          audioCache.play('audios/bird.mp3');
        } else if (imgLink == 'images/003-cat.png') {
          audioCache.play('audios/cat.mp3');
        } else if (imgLink == 'images/004-bee.png') {
          audioCache.play('audios/bee.mp3');
        } else if (imgLink == 'images/005-fish.png') {
          audioCache.play('audios/fish.mp3');
        } else if (imgLink == 'images/006-chicken.png') {
          audioCache.play('audios/chicken.mp3');
        } else if (imgLink == 'images/009-camel.png') {
          audioCache.play('audios/camel.mp3');
        } else if (imgLink == 'images/011-cow.png') {
          audioCache.play('audios/cow.mp3');
        } else if (imgLink == 'images/012-halloween.png') {
          audioCache.play('audios/halloween.mp3');
        } else if (imgLink == 'images/013-duck.png') {
          audioCache.play('audios/duck.mp3');
        } else if (imgLink == 'images/014-snake.png') {
          audioCache.play('audios/snake.mp3');
        } else if (imgLink == 'images/015-turkey.png') {
          audioCache.play('audios/turkey.mp3');
        } else if (imgLink == 'images/016-frog.png') {
          audioCache.play('audios/frog.mp3');
        }
        timer?.isActive;
        timer = Timer.periodic(Duration(seconds: 1), (timer) {
          setState(() {
            if (counter_ > 0) {
              counter_--;
            } else {
              timer.cancel();
              counter_ = 0.5;
              medium[num] = false;
              medium[vitri] = false;
              changeMedium[num] = checkedORback[0];
              changeMedium[vitri] = checkedORback[0];
              score += 10;
            }
          });
        });
      } else {
        audioCache.play('audios/baby-laugh.mp3');
        timer?.isActive;
        timer = Timer.periodic(Duration(seconds: 1), (timer) {
          setState(() {
            if (counter_ > 0) {
              counter_--;
            } else {
              timer.cancel();
              counter_ = 0.5;
              score -= 5;
              for (int i = 0; i < medium.length; i++) {
                medium[i] = false;
              }
            }
          });
        });
      }
      (trigger = false);
      answer = 30;
    }
  }

  void checkHard(int num, String imgLink) {
    hard[num] = true;
    if (trigger == false) {
      trigger = true;
      answer = positionHard[num];
      vitri = num;
    } else {
      if (answer == positionHard[num]) {
        if (imgLink == 'images/001-dog.png') {
          audioCache.play('audios/dog.mp3');
        } else if (imgLink == 'images/002-bird.png') {
          audioCache.play('audios/bird.mp3');
        } else if (imgLink == 'images/003-cat.png') {
          audioCache.play('audios/cat.mp3');
        } else if (imgLink == 'images/004-bee.png') {
          audioCache.play('audios/bee.mp3');
        } else if (imgLink == 'images/005-fish.png') {
          audioCache.play('audios/fish.mp3');
        } else if (imgLink == 'images/006-chicken.png') {
          audioCache.play('audios/chicken.mp3');
        } else if (imgLink == 'images/009-camel.png') {
          audioCache.play('audios/camel.mp3');
        } else if (imgLink == 'images/011-cow.png') {
          audioCache.play('audios/cow.mp3');
        } else if (imgLink == 'images/012-halloween.png') {
          audioCache.play('audios/halloween.mp3');
        } else if (imgLink == 'images/013-duck.png') {
          audioCache.play('audios/duck.mp3');
        } else if (imgLink == 'images/014-snake.png') {
          audioCache.play('audios/snake.mp3');
        } else if (imgLink == 'images/015-turkey.png') {
          audioCache.play('audios/turkey.mp3');
        } else if (imgLink == 'images/016-frog.png') {
          audioCache.play('audios/frog.mp3');
        }
        timer?.isActive;
        timer = Timer.periodic(Duration(seconds: 1), (timer) {
          setState(() {
            if (counter_ > 0) {
              counter_--;
            } else {
              timer.cancel();
              counter_ = 0.5;
              hard[num] = false;
              hard[vitri] = false;
              changeHard[num] = checkedORback[0];
              changeHard[vitri] = checkedORback[0];
              score += 10;
            }
          });
        });
      } else {
        audioCache.play('audios/baby-laugh.mp3');
        timer?.isActive;
        timer = Timer.periodic(Duration(seconds: 1), (timer) {
          setState(() {
            if (counter_ > 0) {
              counter_--;
            } else {
              timer.cancel();
              counter_ = 0.5;
              score -= 5;
              for (int i = 0; i < hard.length; i++) {
                hard[i] = false;
              }
            }
          });
        });
      }
      (trigger = false);
      answer = 30;
    }
  }

  @override
  void initState() {
    randomImgEasy();
    randomImgMedium();
    randomImgHard();
    super.initState();
  }

  Widget buildButton(String Status, Color _Color, void tapVoid()) {
    return Expanded(
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: ElevatedButton(
          onPressed: tapVoid,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(_Color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            ),
          ),
          child: Text(
            Status,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }

  Widget playArea_Easy() {
    return Expanded(
      flex: 6,
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Column(
          children: [
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 450),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 2; i++)
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 2,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              checkEasy(
                                  i,
                                  ('images/' +
                                          imgs[animalsEasy[positionEasy[i]]] +
                                          '.png')
                                      .toString());
                            });
                          },
                          child: easy[i]
                              ? Image.asset('images/' +
                                  imgs[animalsEasy[positionEasy[i]]] +
                                  '.png')
                              : Image.asset(changeEasy[i]),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                            ),
                            fixedSize:
                                MaterialStateProperty.all<Size>(Size(100, 100)),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 450),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 2; i < 4; i++)
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 2,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              checkEasy(
                                  i,
                                  ('images/' +
                                          imgs[animalsEasy[positionEasy[i]]] +
                                          '.png')
                                      .toString());
                            });
                          },
                          child: easy[i]
                              ? Image.asset('images/' +
                                  imgs[animalsEasy[positionEasy[i]]] +
                                  '.png')
                              : Image.asset(changeEasy[i]),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                            ),
                            fixedSize:
                                MaterialStateProperty.all<Size>(Size(100, 100)),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 450),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 4; i < 6; i++)
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 2,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              checkEasy(
                                  i,
                                  ('images/' +
                                          imgs[animalsEasy[positionEasy[i]]] +
                                          '.png')
                                      .toString());
                            });
                          },
                          child: easy[i]
                              ? Image.asset('images/' +
                                  imgs[animalsEasy[positionEasy[i]]] +
                                  '.png')
                              : Image.asset(changeEasy[i]),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                            ),
                            fixedSize:
                                MaterialStateProperty.all<Size>(Size(100, 100)),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 450),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 6; i < 8; i++)
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 2,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              checkEasy(
                                  i,
                                  ('images/' +
                                          imgs[animalsEasy[positionEasy[i]]] +
                                          '.png')
                                      .toString());
                            });
                          },
                          child: easy[i]
                              ? Image.asset('images/' +
                                  imgs[animalsEasy[positionEasy[i]]] +
                                  '.png')
                              : Image.asset(changeEasy[i]),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                            ),
                            fixedSize:
                                MaterialStateProperty.all<Size>(Size(100, 100)),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget playArea_Medium() {
    return Expanded(
      flex: 6,
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Column(
          children: [
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 450),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 3; i++)
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 2,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              checkMedium(
                                  i,
                                  ('images/' +
                                          imgs[animalsMedium[
                                              positionMedium[i]]] +
                                          '.png')
                                      .toString());
                            });
                          },
                          child: medium[i]
                              ? Image.asset('images/' +
                                  imgs[animalsMedium[positionMedium[i]]] +
                                  '.png')
                              : Image.asset(changeMedium[i]),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                            ),
                            fixedSize:
                                MaterialStateProperty.all<Size>(Size(100, 100)),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 450),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 3; i < 6; i++)
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 2,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              checkMedium(
                                  i,
                                  ('images/' +
                                          imgs[animalsMedium[
                                              positionMedium[i]]] +
                                          '.png')
                                      .toString());
                            });
                          },
                          child: medium[i]
                              ? Image.asset('images/' +
                                  imgs[animalsMedium[positionMedium[i]]] +
                                  '.png')
                              : Image.asset(changeMedium[i]),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                            ),
                            fixedSize:
                                MaterialStateProperty.all<Size>(Size(100, 100)),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 450),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 6; i < 9; i++)
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 2,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              checkMedium(
                                  i,
                                  ('images/' +
                                          imgs[animalsMedium[
                                              positionMedium[i]]] +
                                          '.png')
                                      .toString());
                            });
                          },
                          child: medium[i]
                              ? Image.asset('images/' +
                                  imgs[animalsMedium[positionMedium[i]]] +
                                  '.png')
                              : Image.asset(changeMedium[i]),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                            ),
                            fixedSize:
                                MaterialStateProperty.all<Size>(Size(100, 100)),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 450),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 9; i < 12; i++)
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 2,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              checkMedium(
                                  i,
                                  ('images/' +
                                          imgs[animalsMedium[
                                              positionMedium[i]]] +
                                          '.png')
                                      .toString());
                            });
                          },
                          child: medium[i]
                              ? Image.asset('images/' +
                                  imgs[animalsMedium[positionMedium[i]]] +
                                  '.png')
                              : Image.asset(changeMedium[i]),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                            ),
                            fixedSize:
                                MaterialStateProperty.all<Size>(Size(100, 100)),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget playArea_Hard() {
    return Expanded(
      flex: 6,
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Column(
          children: [
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 450),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 4; i++)
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 2,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              checkHard(
                                  i,
                                  ('images/' +
                                          imgs[animalsHard[positionHard[i]]] +
                                          '.png')
                                      .toString());
                            });
                          },
                          child: hard[i]
                              ? Image.asset('images/' +
                                  imgs[animalsHard[positionHard[i]]] +
                                  '.png')
                              : Image.asset(changeHard[i]),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                            ),
                            fixedSize:
                                MaterialStateProperty.all<Size>(Size(100, 100)),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 450),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 4; i < 8; i++)
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 2,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              checkHard(
                                  i,
                                  ('images/' +
                                          imgs[animalsHard[positionHard[i]]] +
                                          '.png')
                                      .toString());
                            });
                          },
                          child: hard[i]
                              ? Image.asset('images/' +
                                  imgs[animalsHard[positionHard[i]]] +
                                  '.png')
                              : Image.asset(changeHard[i]),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                            ),
                            fixedSize:
                                MaterialStateProperty.all<Size>(Size(100, 100)),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 450),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 8; i < 12; i++)
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 2,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              checkHard(
                                  i,
                                  ('images/' +
                                          imgs[animalsHard[positionHard[i]]] +
                                          '.png')
                                      .toString());
                            });
                          },
                          child: hard[i]
                              ? Image.asset('images/' +
                                  imgs[animalsHard[positionHard[i]]] +
                                  '.png')
                              : Image.asset(changeHard[i]),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                            ),
                            fixedSize:
                                MaterialStateProperty.all<Size>(Size(100, 100)),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 450),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 12; i < 16; i++)
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 2,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              checkHard(
                                  i,
                                  ('images/' +
                                          imgs[animalsHard[positionHard[i]]] +
                                          '.png')
                                      .toString());
                            });
                          },
                          child: hard[i]
                              ? Image.asset('images/' +
                                  imgs[animalsHard[positionHard[i]]] +
                                  '.png')
                              : Image.asset(changeHard[i]),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                            ),
                            fixedSize:
                                MaterialStateProperty.all<Size>(Size(100, 100)),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 450),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 16; i < 20; i++)
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 2,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              checkHard(
                                  i,
                                  ('images/' +
                                          imgs[animalsHard[positionHard[i]]] +
                                          '.png')
                                      .toString());
                            });
                          },
                          child: hard[i]
                              ? Image.asset('images/' +
                                  imgs[animalsHard[positionHard[i]]] +
                                  '.png')
                              : Image.asset(changeHard[i]),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                            ),
                            fixedSize:
                                MaterialStateProperty.all<Size>(Size(100, 100)),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 450),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 20; i < 24; i++)
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 2,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              checkHard(
                                  i,
                                  ('images/' +
                                          imgs[animalsHard[positionHard[i]]] +
                                          '.png')
                                      .toString());
                            });
                          },
                          child: hard[i]
                              ? Image.asset('images/' +
                                  imgs[animalsHard[positionHard[i]]] +
                                  '.png')
                              : Image.asset(changeHard[i]),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                            ),
                            fixedSize:
                                MaterialStateProperty.all<Size>(Size(100, 100)),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[100],
        body: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          child: Expanded(
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: Column(
                children: [
                  Expanded(
                    child: ConstrainedBox(
                      constraints: BoxConstraints.expand(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Level: ' + gameLevel,
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.purple,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            'Score: ' + score.toString(),
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.purple,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ConstrainedBox(
                      constraints: BoxConstraints.expand(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildButton('EASY', Colors.blue, Easy_btnTap),
                          SizedBox(
                            width: 10,
                          ),
                          buildButton('MEDIUM', Colors.green, Medium_btnTap),
                          SizedBox(
                            width: 10,
                          ),
                          buildButton('HARD', Colors.red, Hard_btnTap),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  gameLevel == 'Easy'
                      ? playArea_Easy()
                      : gameLevel == 'Medium'
                          ? playArea_Medium()
                          : playArea_Hard(),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ConstrainedBox(
                      constraints: BoxConstraints.expand(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildButton('START', Colors.purple, startGame),
                          SizedBox(
                            width: 10,
                          ),
                          buildButton('RESTART', Colors.orange, restartGame),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
