//
//  ViewController.swift
//  MobileMap
//
//  Created by student3 on 3/20/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    let herseyAnnotation = MKPointAnnotation()
    let address = "McDonald's"
    let geocoder = CLGeocoder()

    override func viewDidLoad() {
        super.viewDidLoad()
        let latitude: Double = 42.102332924
        let longitude: Double = -87.955667844
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        herseyAnnotation.title = "Hersey High School"
        herseyAnnotation.coordinate = coordinate
        mapView.addAnnotation(herseyAnnotation)
        
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            for places in placemarks!
            {
                let annotation = MKPointAnnotation()
                annotation.coordinate = (places.location?.coordinate)!
                annotation.title = places.name
                self.mapView.addAnnotation(annotation)
            }
        }
    }

}

