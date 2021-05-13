import SwiftUI
import MapKit

struct Map: UIViewRepresentable {
    @Binding var landmarks: [LandmarkAnnotation]
    @Binding var isClicked: Bool
    @Binding var selectedAnnotation: MKAnnotation?    
    let manager : CLLocationManager = CLLocationManager()
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.addAnnotations(landmarks)
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) { }
    
    class Coordinator: NSObject, MKMapViewDelegate{
        var parent: Map
        
        init(_ parent: Map){
            self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            print(mapView.centerCoordinate)
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = .systemBlue
            renderer.lineWidth = 5
            return renderer
        }
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            self.parent.isClicked = true
            self.parent.selectedAnnotation = view.annotation
            
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotaion: MKAnnotation) -> MKAnnotationView? {
            let view = MKPinAnnotationView(annotation: annotaion, reuseIdentifier: nil)
            view.canShowCallout = true
            view.showsLargeContentViewer = true
            return view
        }
    }
}
