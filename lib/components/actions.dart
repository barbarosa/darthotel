part of darthotel.components;

class _Actions extends react.Component {

  get handleInput => props['userInput'];
  get selectFilterAction => props['selectFilterAction'];
  get selectedFilter => props['selectedFilter'];

  render() =>
    react.div({'className': 'ui center aligned container'}, [
        react.div({'className': 'ui centered aligned item'}, [
          react.div({'className': 'ui action input'}, [
            searchInputComponent({
              'userInput': handleInput,
              'selectedFilter': selectedFilter
            }),
            selector({'selectFilterAction': selectFilterAction})
          ])
        ]),
      react.div({'className': 'ui hidden divider'})
    ]);
}

var actions = react.registerComponent(() => new _Actions());