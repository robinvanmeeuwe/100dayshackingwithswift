//
//  ViewController.swift
//  project22
//
//  Created by Robin van Meeuwen on 23/09/2021.
//

import CoreLocation
import UIKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var dinstanceReading: UILabel!
    var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        
        view.backgroundColor = .gray
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    startScanning()
                }
            }
        }
    }
    
    func startScanning() {
        let uuid = UUID(uuidString: "5A4BCFCE-174E-4BAC-A814-092E77F6B7E5")!
        let beaconRegion = CLBeaconRegion(uuid: uuid, major: 123, minor: 456, identifier: "MyBeacon")
        
        locationManager?.startMonitoring(for: beaconRegion)
        locationManager?.startRangingBeacons(in: beaconRegion)
    }
    
    func update(distance: CLProximity) {
        UIView.animate(withDuration: 1) {
            switch distance {
           
            case .far:
                self.view.backgroundColor = .blue
                self.dinstanceReading.text = "FAR"
                
            case .near:
                self.view.backgroundColor = .orange
                self.dinstanceReading.text = "NEAR"
                
            case .immediate:
                self.view.backgroundColor = .red
                self.dinstanceReading.text = "RIGHT HERE"
                
            default:
                self.view.backgroundColor = .gray
                self.dinstanceReading.text = "UNKOWN"
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didRange beacons: [CLBeacon], in region: CLBeaconRegion) {
        if let beacon = beacons.first {
               update(distance: beacon.proximity)
           } else {
               update(distance: .unknown)
           }
    }


}

