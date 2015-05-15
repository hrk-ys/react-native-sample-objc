'use strict';

var React = require('react-native');
var {
  Text,
  View,
  TouchableHighlight,
  NavigatorIOS,
  ScrollView,
} = React;

var styles = React.StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#F6F6EF',
    //backgroundColor: 'white',
    //alignItems: 'center',
  },
  myview: {
  },
});

//var CustomView = require('./CustomView');

var subscription;

var MyView = React.createClass({
  render: function() {
    return (
        <ScrollView style={styles.myview}>
          <View>
            <Text>hogehoge</Text>
          </View>
        </ScrollView>
    );
  },
});

var ModalViewController = require('NativeModules').ModalViewController;

var SimpleApp = React.createClass({
  getInitialState: function() {
    return {name: 'foo'};
  },
  _onLeftButtonPress: function() {
    console.log('left button');
    ModalViewController.closeModal();
  },

  render: function() {
    return (
      <NavigatorIOS
        style={styles.container}
        tintColor='yellow'
        titleTextColor='red'
        barTintColor='pink'
        navigationBarHidden={false}
        initialRoute={{
          component: MyView,
          title: 'My View Title',
          //passProps: { myProp: 'foo' },
          rightButtonTitle: 'Close',
          onRightButtonPress: () => this._onLeftButtonPress(),
        }}
      />
    );
  },
});

React.AppRegistry.registerComponent('SimpleApp', () => SimpleApp);

module.exports = SimpleApp;

