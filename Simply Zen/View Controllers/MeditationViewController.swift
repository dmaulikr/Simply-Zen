//
//  MeditationViewController.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/19/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit

class MeditationViewController: UIViewController {

    @IBOutlet weak var meditationView: MeditationView!
    var words: String? = nil
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(words ?? "No words")
//        let lesson = SZLesson(addLesson: "Lesson 1", withFilename: "lesson1", level: 1, durationInSeconds: 65)
//        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        meditationView.addMeditateAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func meditationViewTapped(_ sender: Any) {
        print("Meditation View meditationViewTapped")
    }
    

}
