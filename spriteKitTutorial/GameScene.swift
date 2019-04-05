//
//  GameScene.swift
//  spriteKitTutorial
//
//  Created by Robin on 2019-04-05.
//  Copyright © 2019 Robin. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    private var player : SKSpriteNode?
    private var gunShoot : SKSpriteNode?
    
    override func didMove(to view: SKView) {
       
        player = SKSpriteNode(color: .red, size: CGSize(width: 100, height: 100))
        addChild(player!)
       
    }
    

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            var location = touch.location(in: self)
            player?.position = location
            shootGun()
        }
    }
    
    func shootGun() {
        gunShoot = SKSpriteNode(color: .blue, size: CGSize(width: 10, height: 10))
        gunShoot?.position = CGPoint(x: player!.position.x, y: player!.position.y + 2)
        addChild(gunShoot!)
        
        var actionArray = [SKAction]()
        var myAction = SKAction.move(to: CGPoint(x: player!.position.x, y: player!.position.y + 1000), duration: 0.5)
        var deleteNode = SKAction.removeFromParent()
        actionArray.append(myAction)
        actionArray.append(deleteNode)
        gunShoot!.run(SKAction.sequence(actionArray))
        
        
        
    }
    
}
