import { combineReducers } from 'redux'
import routerReducer from '../pages/Router/reducer'

export default combineReducers({
    router: routerReducer,
})
