//
//  BarView.swift
//  iOSApp
//
//  Created by Haloperidol on 9.04.21.
//

import SwiftUI

struct BarView: View {
    @State var bar : Bar
    var body: some View {
        Text("Some bar there")
    }
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        BarView(bar: Bar())
    }
}
