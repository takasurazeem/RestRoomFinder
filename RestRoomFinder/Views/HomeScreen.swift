//
//  Actions.swift
//  RestRoomFinder
//
//  Created by Mohammad Azam on 10/15/20.
//

import SwiftUI
import Combine

struct HomeScreen: View {
    
    @EnvironmentObject var store: Store<AppState>

    @ObservedObject private var locationManager = LocationManager()
    @State private var cancellables: AnyCancellable? = nil
    
    struct Props {
        let restrooms: [Restroom]
        let onFetchRestroomsByLatLong: (Double, Double) -> Void
    }
    
    private func map(state: RestRoomState) -> Props {
        Props(restrooms: state.restrooms) { lat, long in
            store.dispatch(action: FetchRestroomsAction(latitude: lat, longitude: long))
        }
    }
    
    var body: some View {
        let props = map(state: store.state.restrooms)
        VStack {
            
        }
        .onAppear {
            self.cancellables = locationManager.$location.sink { location in
                if let location {
                    props.onFetchRestroomsByLatLong(
                        location.coordinate.latitude,
                        location.coordinate.longitude
                    )
                }
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        let store = Store(
            reducer: appReducer,
            state: AppState(),
            middlewares: [restroomMiddleware()]
        )
        HomeScreen()
            .environmentObject(store)
    }
}
