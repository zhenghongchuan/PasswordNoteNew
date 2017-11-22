import React from 'react'
import { ImageBackground, StyleSheet } from 'react-native'
import { Provider } from 'react-redux'
import { Store } from 'redux'
import Pages from './pages/Router'
import { createStore, persistStore } from './store'

const store = createStore() as Store<IStoreState>

interface IOwnState {
  rehydrated: boolean
}

interface IOwnProps {
}

const styles = StyleSheet.create({
  background: {
    alignItems: 'center',
    flex: 1,
  },
})

class App extends React.Component<IOwnProps, IOwnState> {

  constructor(props: IOwnProps) {
    super(props)
    this.state = {
      rehydrated: false,
    }
  }

  public componentDidMount() {
    persistStore(store, () => this.setState({ rehydrated: true }))
  }

  render() {
    return this.state.rehydrated ? (
      <Provider store={store}>
          <Pages />
      </Provider>
    ) : (
        <ImageBackground
          style={styles.background}
          source={{ uri: 'SPLASH' }}
        />
    )
  }
}

export default App
