//
//  HomeViewController.swift
//  HBONOW
//
//  Created by Waruna Kaushalya on 1/27/20.
//  Copyright © 2020 Waruna Kaushalya. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import FirebaseAuth
import FirebaseFirestore
//var videos: [Video] = []


//Hbo now
class HomeViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var videos: [Video] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
       videos = createArray()
        
//        tableView.delegate = self
//        
//        tableView.dataSource = self
        
    }
    
    func createArray() -> [Video] {
//        var tempVideos: [Video] = []
        
         let video1 = Video(image: #imageLiteral(resourceName: "e"), title: "Your a app")
         let video2 = Video(image: #imageLiteral(resourceName: "aimage"), title: "Your b app")
         let video3 = Video(image: #imageLiteral(resourceName: "f"), title: "Your c app")
         let video4 = Video(image: #imageLiteral(resourceName: "b"), title: "Your d app")
         let video5 = Video(image: #imageLiteral(resourceName: "g"), title: "Your e app")
         let video6 = Video(image: #imageLiteral(resourceName: "b"), title: "Your f app")

//        tempVideos.append(video1)
//        tempVideos.append(video2)
//        tempVideos.append(video3)
//        tempVideos.append(video4)
//        tempVideos.append(video5)
//        tempVideos.append(video6)
        
        return [video1,video2,video3,video4,video5,video6]
        
    }
    
    
}



extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let video = videos[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell")  as! VideoCell
        
        cell.setVideo(video: video)
        
        return cell
        
}
}
