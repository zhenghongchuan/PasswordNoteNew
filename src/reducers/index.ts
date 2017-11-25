import { combineReducers } from 'redux'
import passwordListReducer from '../pages/PasswordList/reducer'
import routerReducer from '../pages/Router/reducer'

export default combineReducers({
    router: routerReducer,
    passwordDatabase: passwordListReducer,
})
