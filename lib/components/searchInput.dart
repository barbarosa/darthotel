part of darthotel.components;

class SearchInputComponent extends react.Component {

  get userInput => props['userInput'];

  void componentDidMount(root) =>
    print('mounted search input');

  dynamic render() =>
    react.div({'className': 'ui right action input'}, [
      react.input({'type': 'text', 'onChange': (react.SyntheticFormEvent e) => userInput(e.target.value)})
    ]);
}
//register component to react-dart
var searchInputComponent = react.registerComponent(() => new SearchInputComponent());
