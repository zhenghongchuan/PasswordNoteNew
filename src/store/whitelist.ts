import { keys, omit } from 'lodash'

const whitelist: string[] = [
]

const omitDevStateList = [
  'loading',
]

export default (state: IStoreState) => __DEV__ ? keys(omit(state, omitDevStateList)) : whitelist
