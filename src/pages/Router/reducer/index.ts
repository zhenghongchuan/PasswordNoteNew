import { NavigationAction, NavigationState } from 'react-navigation'
import { Navigator } from '../index'

const routerReducer = (
  state: NavigationState | null = null,
  action: NavigationAction,
) => {

  const nextState = Navigator.router.getStateForAction(action, state)
  if (action.type === 'Navigation/SET_PARAMS' && state) {
    nextState.routes[0].index = state.routes[0].index
    return nextState
  } else {
    return nextState || state
  }
}

export default routerReducer
