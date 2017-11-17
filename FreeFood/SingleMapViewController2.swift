//
//  SingleMapViewController.swift
//  FreeFood
//
//  Created by 김종현 on 2017. 11. 13..
//  Copyright © 2017년 김종현. All rights reserved.
//

import UIKit
import MapKit

class SingleMapViewController: UIViewController {
    @IBOutlet weak var singleMapView: MKMapView!
    var sItem:[String:String] = [:]
    var sLat: Double?
    var sLong: Double?

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        
        //zoomToRegion()

        // Do any additional setup after loading the view.
        //print("sItem = \(sItem)")
        sLat = (sItem["lat"]! as NSString).doubleValue
        sLong = (sItem["lng"]! as NSString).doubleValue
        
        //print("sLat = \(sLat)")
        
        let sLoc = sItem["loc"]
        let sAddr = sItem["addr"]
        zoomToRegion()
        
        self.title = sLoc
        
        let anno = MKPointAnnotation()
        anno.coordinate.latitude = sLat!
        anno.coordinate.longitude = sLong!
        anno.title = sLoc
        anno.subtitle = sAddr
        
        singleMapView.addAnnotation(anno)
        singleMapView.selectAnnotation(anno, animated: true)
        
    }
    
    func zoomToRegion() {
        // 35.162685, 129.064238
        let center = CLLocationCoordinate2DMake(sLat!, sLong!)
        let span = MKCoordinateSpanMake(0.35, 0.44)
        let region = MKCoordinateRegionMake(center, span)
        singleMapView.setRegion(region, animated: true)
       
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
