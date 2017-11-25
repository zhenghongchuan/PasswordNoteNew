import React from 'react'
import { Button, FlatList, Text, View } from 'react-native'
import { NavigationActions } from 'react-navigation'
import { connect } from 'react-redux'
import { returntypeof } from 'react-redux-typescript'

const mapStateToProps = (state: IStoreState) => ({
    passwordList: state.passwordDatabase,
})

const statePropsType = returntypeof(mapStateToProps)
type IStateProps = typeof statePropsType

const mapDispatchToProps = {
    navigate: NavigationActions.navigate,
}

type IDispatchProps = typeof mapDispatchToProps

type IProps = IStateProps & IDispatchProps

class PasswordList extends React.Component<IProps> {
    render() {
        return (
            <View>
                <FlatList
                    data={this.props.passwordList}
                    keyExtractor={this.keyExtractor}
                    renderItem={this.renderItem}
                />
                <Button
                    title="点我"
                    onPress={this.addNewPaswordItem}
                />
            </View>
        )
    }

    keyExtractor = (item: IBasePassword) => `${item.id} ${item.updateTime}`

    renderItem = ({item}: { item: IBasePassword}) => {
        return (
            <Text>{`${item.id}`}</Text>
        )
    }

    addNewPaswordItem = () => {
        this.props.navigate({
            routeName: 'PasswordEditor',
        })
    }
}

export default connect(mapStateToProps, mapDispatchToProps)(PasswordList)
