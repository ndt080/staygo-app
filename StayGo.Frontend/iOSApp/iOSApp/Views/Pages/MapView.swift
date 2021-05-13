import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var str: Storage
    @State var isActive: Bool = false
    @State var selectedAnnotation: MKAnnotation?
    @State var bar: Bar?
    
    var body: some View {
        NavigationView{
            ZStack(){
                Map(landmarks: $str.barAnnotation, isClicked: $isActive, selectedAnnotation: $selectedAnnotation)
                    .ignoresSafeArea(.all, edges: .all)
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                MapSheet(isActive: $isActive, selectedAnnotation: $selectedAnnotation, bar: $bar)
                    .offset(y: isActive ? 0 : 600)
                    .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                    .gesture(
                        DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                            .onEnded { value in
                                if value.translation.height > 0 && value.translation.width < 100 && value.translation.width > -100 {
                                    isActive = false
                                }
                            }
                    )
                
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
