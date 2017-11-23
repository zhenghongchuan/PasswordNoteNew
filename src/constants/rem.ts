import { Dimensions } from 'react-native'
export const SCREEN_HEIGHT = Dimensions.get('window').height
export const SCREEN_WIDTH = Dimensions.get('window').width

const ratio = SCREEN_WIDTH / 414

export const getPx = (px: number, unit: number = ratio) => px / unit
