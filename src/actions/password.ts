import ActionType from './ActionType'

export const savePassword = (item: IBasePassword) => ({
    type: ActionType.savePassword,
    payload: item,
})
