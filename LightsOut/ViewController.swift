//
//  ViewController.swift
//  LightsOut
//
//  Created by CSSE Department on 1/8/15.
//  Copyright (c) 2015 CSSE Department. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var iphoneLabel: UILabel!
    
    @IBOutlet weak var ipadNavBar: UINavigationBar!
    
    
    @IBOutlet var buttons: [UIButton]!
    
    let onImage = UIImage(named: "light_on.png")
    let offImage = UIImage(named: "light_off.png")
    
    var game = LinearLightsOutGameC(numLights: 13)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        updateView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func pressedButton(sender: AnyObject) {
        var button = sender as UIButton
//        println("pressed button with tag \(button.tag)")
        game.pressedLightAtIndex(button.tag)
        updateView()
    }
    
    
    @IBAction func pressedNewGame(sender: AnyObject) {
        println("pressed New Game")
        game = LinearLightsOutGameC(numLights: 13)
        updateView()
    }
    
    func updateView() {
//        println(game);
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            iphoneLabel.text = game.outputGameState()
        }
        else {
            ipadNavBar.topItem?.title = game.outputGameState()
        }
        for button in buttons {
            if game.isLightOnAtIndex(button.tag){
                button.setImage(onImage, forState:.Normal)
            } else {
                button.setImage(offImage, forState: .Normal)
            }
        }

    }
}

