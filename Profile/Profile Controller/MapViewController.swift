//
//  MapViewController.swift
//  Profile
//
//  Created by Delvin on 02/09/19.
//  Copyright © 2019 Delvin. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    let locationManager = CLLocationManager()
    var currLoc: CLLocationCoordinate2D!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var getLocLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
       
        let actionButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(getLocation))
        self.navigationItem.rightBarButtonItem = actionButton
        
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    @objc func getLocation() {
        if(currLoc != nil){
            self.navigationController?.popViewController(animated: true)
//            let main = UIStoryboard(name: "Profile", bundle: nil)
//            let second = main.instantiateViewController(withIdentifier: "editProfile")
//            self.present(second, animated: true)
        }
        else {
            getLocLabel.text = "Please Wait"
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.getLocLabel.text = ""
            }
        }
    }
    
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
    }

}

extension MapViewController : CLLocationManagerDelegate {
    private func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            mapView.setRegion(region, animated: true)
            
            print(mapView.userLocation.coordinate)
            currLoc = mapView.userLocation.coordinate
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error.localizedDescription)")
    }
}
