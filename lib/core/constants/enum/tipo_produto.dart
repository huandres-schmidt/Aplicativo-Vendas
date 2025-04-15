enum TipoProduto{
  linguica(value: 1, desc: 'Linguiça'),
  frios(value: 2, desc: 'Frios'),
  pizza(value: 3, desc: 'Pizza'),
  lacteos(value: 4, desc: 'Lacteos');

  final String desc;
  final int value;

  const TipoProduto({required this.value,required this.desc});
}