//
//  NextViewController.swift
//  slideShowApp
//
//  Created by 橋本和磨 on 2019/02/06.
//  Copyright © 2019年 橋本和磨. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    var getImage:UIImage!
    @IBOutlet weak var nextImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        nextImageView.image = getImage
        // Do any additional setup after loading the view.
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
