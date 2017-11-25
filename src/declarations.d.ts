declare interface IStoreState {
    router: {
        index: number
        routes: IRoute[]
        routeName: string
        key: string
        params?: {},
    },
    passwordDatabase: IBasePassword[],
}

declare interface IBasePassword {
    id: string,
    titleImage: string,
    title: string,
    username: string,
    password: string,
    description: string,
    extra: string,
    createTime: number,
    updateTime: number,
}
