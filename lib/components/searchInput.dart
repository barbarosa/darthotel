part of darthotel.components;

class _SearchInputComponent extends react.Component {

  get userInput => props['userInput'];
  get selectedFilter => props['selectedFilter'];

  void componentDidMount(root) =>
    print('mounted search input');

  render() =>
    react.div({'className': 'ui right input'}, [
      react.input({
        'type': 'text',
        'className': 'right aligned',
        'placeholder': 'Filter by ${selectedFilter} ...',
        'onChange': (react.SyntheticFormEvent e) => userInput(e.target.value)}),
    ]);
}

var searchInputComponent = react.registerComponent(() => new _SearchInputComponent());
