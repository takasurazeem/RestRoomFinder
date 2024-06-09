//
//  RestroomsMiddleware.swift
//  RestRoomFinder
//
//  Created by Takasur Home on 09/06/2024.
//

import Foundation

func restroomMiddleware() -> Middleware<AppState> {
    return {
        state,
        action,
        dispatch in
        switch action {
        case let action as FetchRestroomsAction:
            fetchRestrooms(action: action, dispatch: dispatch)
        default:
            break
        }
    }
}

private func fetchRestrooms(action: FetchRestroomsAction, dispatch: @escaping Dispatcher) {
    Task {
        do {
            let restrooms = try await RestroomService(
                logger: ConsoleLogger(),
                networkManager: MainNetworkManager()
            ).getRestRoomByLatLong(lat: action.latitude, long: action.longitude)
            dispatch(SetRestroomsAction(restrooms: restrooms ?? []))
        } catch {
            ConsoleLogger().log(error.localizedDescription)
        }
    }
}