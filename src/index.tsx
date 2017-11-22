import React from 'react'
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
    return (
      <Provider store={store}>
          <Pages />
      </Provider>
    )
  }
}

export default App
