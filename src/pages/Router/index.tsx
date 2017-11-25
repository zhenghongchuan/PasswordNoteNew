import React from 'react'
import {
  addNavigationHelpers,
  NavigationState,
  StackNavigator,
} from 'react-navigation'
import { connect } from 'react-redux'
import pages from './pages'

interface IStateProps {
  router: NavigationState
}

interface IOwnProps {
  // tslint:disable-next-line:no-any
  dispatch?: any
}

type IProps = IStateProps & IOwnProps

export const Navigator = StackNavigator(
  pages,
  {
    initialRouteName: 'PasswordList',
  },
)

const NavigatorPage = (props: IProps) => (
  <Navigator
    navigation={
      addNavigationHelpers({
        dispatch: props.dispatch,
        state: props.router,
      })
    }
  />
)

const mapStateToProps = ({ router }: IStoreState) => ({
  router,
})

export default connect<IStateProps, undefined, IOwnProps>(mapStateToProps)(NavigatorPage)
