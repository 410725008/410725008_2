//
//  ViewController.swift
//  410725008_2
//
//  Created by NDHU_CSIE on 2020/11/12.
//  Copyright © 2020 NDHU_CSIE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var ImageView:UIImageView!
    var ImageViewname=""
    override func viewDidLoad() {
        super.viewDidLoad()
        ImageView.image=UIImage(named:ImageViewname)
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
