import React from 'react'
import { Button, ScrollView, TextInput } from 'react-native'
import { NavigationActions } from 'react-navigation'
import { connect } from 'react-redux'
import uuid from 'uuid'
import { savePassword } from '../../actions/password'
import { getPx } from '../../constants/rem'

interface IState {
  passwordItem: IBasePassword
}

const mapDispatchToProps = {
  savePassword,
  back: NavigationActions.back,
}

type IDispatchProps = typeof mapDispatchToProps

type IProps = IDispatchProps

class PasswordEditor extends React.PureComponent<IProps, IState> {

   constructor(props: IProps) {
      super(props)
      this.state = {
        passwordItem: {
          id: uuid.v4(),
          titleImage: '',
          title: '',
          username: '',
          password: '',
          description: '',
          extra: '',
          createTime: Date.now(),
          updateTime: Date.now(),
        },
      }
   }

   render() {
      return (
        <ScrollView>
          <TextInput
            style={{height: getPx(30)}}
            autoCorrect={false}
            onChangeText={this.onChangeText}
          />
          <Button
            title="save"
            onPress={this.savePasswordItem}
          />
        </ScrollView >
      )
  }

   onChangeText = (text: '') => {
     this.setState({
      passwordItem: {
        ...this.state.passwordItem,
        username: text,
      },
     })
   }

   savePasswordItem = () => {
     this.props.savePassword(this.state.passwordItem)
     this.props.back()
   }
}

export default connect(undefined, mapDispatchToProps)(PasswordEditor)
