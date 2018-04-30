//
//  RunViewController.swift
//  fithub-swift
//
//  Created by Raymond Torres on 4/29/18.
//  Copyright © 2018 Raymond Torres. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class RunViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    @IBAction func onStartStop(_ sender: Any) {
        print("tapped start/stop")
        isRunning = !isRunning
    }
    @IBAction func onResetBtn(_ sender: Any) {
        print("reset pressed")
        timer = 0
    }
    @IBAction func onSaveBtn(_ sender: Any) {
        print("saving run")
    }
    var isRunning: Bool = false {
        didSet {
            print("toggled isRunning")
        }
    }
    var timer: TimeInterval = 0
    var locationManager: CLLocationManager!
    var linePointsArr = [CLLocationCoordinate2D]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map.delegate = self
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        map.showsUserLocation = true
        map.userTrackingMode = .follow
//
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapViewWillStartLocatingUser(_ mapView: MKMapView) {
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let coordinate = CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude)
        self.linePointsArr.append(coordinate)
        let line = MKPolyline(coordinates: linePointsArr, count: linePointsArr.count)
//        map.removeOverlays(<#T##overlays: [MKOverlay]##[MKOverlay]#>)
        map.add(line)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    //do stuff
                }
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
