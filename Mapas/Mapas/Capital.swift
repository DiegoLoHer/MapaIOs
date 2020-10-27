//
//  Capital.swift
//  Mapas
//
//  Created by Diego Lopez on 27/10/20.
//

import Foundation
import MapKit

class Capital: NSObject,MKAnnotation{
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    
    init(title: String, coordinate: CLLocationCoordinate2D,info: String){
        self.title=title
        self.coordinate=coordinate
        self.info=info
    }
}
