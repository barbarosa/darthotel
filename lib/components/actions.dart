part of darthotel.components;

class _Actions extends react.Component {

  get handleInput => props['userInput'];
  get selectFilterAction => props['selectFilterAction'];
  get selectedFilter => props['selectedFilter'];

  render() =>
    react.div({'className': 'center aligned container'}, [
      react.div({'className': 'ui text two item menu'}, [
        react.div({'className': 'ui action input'}, [
          searchInputComponent({
            'userInput': handleInput,
            'selectedFilter': selectedFilter
          }),
          selector({'selectFilterAction': selectFilterAction})
        ])
      ])
    ]);
}

var actions = react.registerComponent(() => new _Actions());