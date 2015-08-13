part of darthotel.components;

class Stars extends react.Component {

  List get starsList => props['stars'];

  dynamic render() =>
    react.div({'className': 'meta'}, [
      react.div({'className': 'ui tiny rating'},
        starsList.map((star) =>
          react.div({'className': 'icon ${star} active'})
        )
      )
    ]);
}

var stars = react.registerComponent(() => new Stars());