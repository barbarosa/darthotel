part of darthotel.components;

class _Selector extends react.Component {

  get selectFilterAction => props['selectFilterAction'];

  render () =>
    react.select({
      'className': 'ui compact dropdown',
      'defaultValue': 'name',
      'onChange': (react.SyntheticFormEvent e) => selectFilterAction(e.target.value)}, [

        react.option({'value': 'name'}, 'Name'),
        react.option({'value': 'stars'}, 'Stars'),
        react.option({'value': 'price'}, 'Price'),
        react.option({'value': 'total_rating'}, 'Total Ratings'),
        react.option({'value': 'user_rating'}, 'Best Rating')
    ]);
}

var selector = react.registerComponent(() => new _Selector());