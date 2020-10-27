//
//  MapaViewController.swift
//  Mapas
//
//  Created by Diego Lopez on 27/10/20.
//

import UIKit
import MapKit

class MapaViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapa: MKMapView!
    
    var myCiudad: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        mapa.delegate = self
        
        let London=Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.597222, longitude: -0.1275), info: "Home to the 2012 Summer Olimpic Games")
        let Oslo=Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.25, longitude: 10.75), info: "Oslo")
        let Paris=Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Home to the 2012 Summer Olimpic Games")
        let Roma=Capital(title: "Roma", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Home to the 2012 Summer Olimpic Games")
        let Washington=Capital(title: "Washingont", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Home to the 2012 Summer Olimpic Games")
        
        mapa.addAnnotations([London,Oslo,Paris,Roma,Washington])

        switch myCiudad {
            case 0:
                let appleHQ = CLLocation(latitude: London.coordinate.latitude, longitude: London.coordinate.longitude)
                let regionRadius: CLLocationDistance = 1000.0
                
                let region = MKCoordinateRegion(center: appleHQ.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
                mapa.setRegion(region, animated: true)
            case 1:
                let appleHQ = CLLocation(latitude: Oslo.coordinate.latitude, longitude: Oslo.coordinate.longitude)
                let regionRadius: CLLocationDistance = 1000.0
                
                let region = MKCoordinateRegion(center: appleHQ.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
                mapa.setRegion(region, animated: true)
            case 2:
                let appleHQ = CLLocation(latitude: Paris.coordinate.latitude, longitude: Paris.coordinate.longitude)
                let regionRadius: CLLocationDistance = 1000.0
                
                let region = MKCoordinateRegion(center: appleHQ.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
                mapa.setRegion(region, animated: true)
            case 3:
                let appleHQ = CLLocation(latitude: Roma.coordinate.latitude, longitude: Roma.coordinate.longitude)
                let regionRadius: CLLocationDistance = 1000.0
                
                let region = MKCoordinateRegion(center: appleHQ.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
                mapa.setRegion(region, animated: true)
        default:
            print("asdasdsad")
        }
        // Do any additional setup after loading the view.
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard annotation is Capital else{return nil}
            let identifier = "Capital"
            
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if annotationView == nil{
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
                
                let btn = UIButton(type: .detailDisclosure)
                annotationView?.rightCalloutAccessoryView = btn
            }else{
                annotationView?.annotation = annotation
            }
            return annotationView
        }
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccsessoryControlTapped control: UIColor){
            guard let capital = view.annotation as? Capital else { return }
            let placeName = capital.title
            let placeInfo = capital.info
            
            let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "ok", style: .default))
            present(ac, animated: true)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
