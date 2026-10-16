

enum VALUE {
  TWO,
  THREE,
  FOUR,
  FIVE,
  SIX,
  SEVEN,
  EIGHT,
  NINE,
  TEN,
  JACK,
  QUEEN,
  KING,
  ACE,
}

enum TYPE {
  CLUB,
  DIAMOND,
  HEART,
  SPADE,
}

enum ENHANCEMENT {
  RIEN
  //Types spéciaux du genre pierre, etc
}

class Card {
  VALUE value;
  TYPE kind;
  ENHANCEMENT? enhancement;

  Card(this.value, this.kind, [this.enhancement]);
}