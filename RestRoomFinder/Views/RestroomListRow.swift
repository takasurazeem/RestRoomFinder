//
//  RestroomListRow.swift
//  RestRoomFinder
//
//  Created by Takasur Home on 09/06/2024.
//

import SwiftUI

struct RestroomListRow: View {
    let restroom: Restroom
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(restroom.name ?? "Name not available")
                    .font(.headline)
                Spacer()
                Text(String(format: "%.2f miles", restroom.distance))
            }
            .padding(.top, 10)
            Text(restroom.addess)
                .font(.subheadline)
                .opacity(0.5)
            Button("Directions") {
                
            }
            .font(.caption)
            .foregroundColor(.white)
            .padding(6)
            .background(Color(#colorLiteral(red: 0.184266597, green: 0.8003296256, blue: 0.4435204864, alpha: 1)))
            .cornerRadius(6)
            
            Text(restroom.comment ?? "")
                           .font(.footnote)
            
            HStack {
                Text(restroom.accessible ? "♿️" : "")
            }
        }
    }
}

#Preview {
    RestroomListRow(
        restroom: .example
    )
}
