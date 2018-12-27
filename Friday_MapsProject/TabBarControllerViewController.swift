//
//  TabBarControllerViewController.swift
//  Friday_MapsProject
//
//  Created by Mounik Yelakanti on 12/21/18.
//  Copyright © 2018 Mounik Yelakanti. All rights reserved.
//

import UIKit
import GoogleMaps
import MapKit

class TabBarControllerViewController: UITabBarController {

    @IBOutlet weak var MapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //API Key:  AIzaSyCp6YSFCn0fn2UCb-Ofg1vdLwPAgt-QxEw
        
        // Create a GMSCameraPosition that tells the map to display the
        // 29.744883, -95.607086 office Address
        let camera = GMSCameraPosition.camera(withLatitude: 29.74, longitude: -95.60, zoom: 6.0)
        let MapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = MapView
        
        // Creates a marker of work location.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "2000 Diary Ashford"
        marker.snippet = "Work Location"
        marker.map = MapView
        
        // creates a marker of home address 29.739534, -95.601687
//        _ = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: 29.739534, longitude: -95.601687)
//        marker.title = "12419 Ella lee ln"
//        marker.snippet = "Home Address"
//        marker.map = MapView
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
