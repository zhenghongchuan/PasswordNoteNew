declare interface IStoreState {
    router: {
        index: number
        routes: IRoute[]
        routeName: string
        key: string
        params?: {},
    }
}
