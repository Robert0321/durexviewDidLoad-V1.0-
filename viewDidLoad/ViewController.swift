//
//  ViewController.swift
//  viewDidLoad
//
//  Created by user on 27/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var label: UILabel!
    var index = 0
    let products = ["Durex Extra Safe","Durex Mutual Climax","Durex Fetherlite","Durex Invisible Extra Sensitive","Durex Comfort XL","Durex Real Feel","Durex Sensation","Durex Performa","Durex Intense Orgasmic Gel","Durex Pleasuremax","Durex Together","Durex Love"]
    var timer: Timer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = products[index]
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
            self.nextproducts()
        }
        
        view.backgroundColor = UIColor.white
        let durexEmitterCell = CAEmitterCell()
        durexEmitterCell.contents = UIImage(named: "durex")?.cgImage
        durexEmitterCell.scale = 0.02 //durex大小
        durexEmitterCell.lifetime = 15.0 //出現時間(秒)
        durexEmitterCell.birthRate = 10 //一秒生幾個
        durexEmitterCell.velocity = -10 //移動速度
        durexEmitterCell.velocityRange = -10 //移動速度
        durexEmitterCell.yAcceleration = 50  //向下加速度
        durexEmitterCell.xAcceleration = 1 //向右加速度
        durexEmitterCell.spin = -0.1 // 轉速
        durexEmitterCell.spinRange = 1.0 //轉速範圍
        durexEmitterCell.emissionRange = .pi //左右落下
        let durexEmitterLayer = CAEmitterLayer()
        durexEmitterLayer.emitterPosition = CGPoint(x: view.bounds.width / 2, y: -50)
        durexEmitterLayer.emitterSize = CGSize(width: view.bounds.width, height: 0)
        durexEmitterLayer.emitterShape = .line
        durexEmitterLayer.emitterCells = [durexEmitterCell]
        view.layer.addSublayer(durexEmitterLayer)
        
    }
    func nextproducts() {
            index = (index + 1) % products.count
            let transition = CATransition()
            transition.duration = 0.5
            transition.type = .push
            transition.subtype = .fromRight
            label.text = products[index]
            label.layer.add(transition, forKey: "nextproducts")
    }
}

