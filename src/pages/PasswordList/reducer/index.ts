import ActionType from '../../../actions/ActionType'

const defaultValue: IBasePassword[] = []

export default (state = defaultValue, action: {type: string, payload: IBasePassword}) => {
    if (action.type === ActionType.savePassword) {
        return [...state, action.payload]
    }
    return state
}
