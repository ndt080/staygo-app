//
//  BarView.swift
//  iOSApp
//
//  Created by Haloperidol on 9.04.21.
//

import SwiftUI

struct BarView: View {
    @State var bar : Bar
    @State var netwManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(
                netwManager.bars,
                id: \.id
            ){
                Text($0.name)
            }
            .navigationBarTitle(Text("Bars"), displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        BarView(bar: Bar())
    }
}
