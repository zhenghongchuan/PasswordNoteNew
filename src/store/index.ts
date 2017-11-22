import { AsyncStorage } from 'react-native'
import { compose, createStore as createStoreAction, Store } from 'redux'
import { autoRehydrate, persistStore as persistStoreAction } from 'redux-persist'
import middleWare from '../middlewares'
import reducer from '../reducers'
import whitelist from './whitelist'

export const persistStore = (store: Store<IStoreState>, callback: () => void) =>
  persistStoreAction(
    store,
    {
      storage: AsyncStorage,
      whitelist: whitelist(store.getState()),
    },
    () => {
      callback()
    },
  )
export const createStore = () => {
  // tslint:disable-next-line:no-string-literal
  const composeAction = __DEV__ && global['reduxNativeDevToolsCompose'] ? global['reduxNativeDevToolsCompose'] : compose
  const enhancer = composeAction(
    autoRehydrate(),
    middleWare,
  )
  return createStoreAction(reducer, undefined, enhancer)
}
