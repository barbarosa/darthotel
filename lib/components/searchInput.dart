part of darthotel.components;

class SearchInputComponent extends React.Component {

  get userInput => props['userInput'];

  void componentDidMount(root) =>
    print('mounted search input');

  dynamic render() =>
    React.input({'type': 'text', 'onChange': (React.SyntheticFormEvent e) => userInput(e.target.value)});

}
//register component to react-dart
dynamic searchInputComponent = React.registerComponent(() => new SearchInputComponent());
