//
//  Connector.swift
//  StuffedAnimalMortalKombatMultiPlayer
//
//  Created by Shannon Armon on 6/9/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit
import MultipeerConnectivity

private let serviceType = "SAMK"

private let _singleton = Connector()

class Connector: NSObject, MCSessionDelegate, MCNearbyServiceAdvertiserDelegate, MCNearbyServiceBrowserDelegate {
   
    class func sharedConnector() -> Connector { return _singleton }
    
    var browser: MCNearbyServiceBrowser? // for iPad
    var advertiser: MCNearbyServiceAdvertiser? //for iphone
    
    var session: MCSession?
    
    var myPeerID: MCPeerID?
    
    var worldID: MCPeerID?
    
    var playersInfo: [String: AnyObject] = [:]
    
    var myInfo: [String:AnyObject] = [:]
    
//        "color" : UIColor(red: 0.16, green: 0.96, blue: 0.31, alpha: 1)
//    
//    ]
    
    var gameBoard: GameViewController?
    var gameScene: GameScene?
    var contorller: UserControllerViewController?
    
    
    func startBrowsing() { // iPad
    
        myPeerID = MCPeerID(displayName: "World")
        
        session = MCSession(peer: myPeerID)
        session?.delegate = self
        
        browser = MCNearbyServiceBrowser(peer: myPeerID, serviceType: serviceType)
        
        browser?.delegate = self
        
        browser?.startBrowsingForPeers()
    }
    
    func startAdvertising() { //iPhone
    
        myPeerID = MCPeerID(displayName: "BigHomie")
        
        session = MCSession(peer: myPeerID)
        session?.delegate = self
        
        advertiser = MCNearbyServiceAdvertiser(peer: myPeerID, discoveryInfo: myInfo, serviceType: serviceType)
        advertiser?.delegate = self
        
        advertiser?.startAdvertisingPeer()
    }
    //////////// MARK: BROWSER DELEGATE
    
    func browser(browser: MCNearbyServiceBrowser!, foundPeer peerID: MCPeerID!, withDiscoveryInfo info: [NSObject : AnyObject]!) {
        
            println("found" + peerID.displayName)
            println("found \(info)")
        
        playersInfo[peerID.displayName] = info
        
        //INVITING THE PPER
        browser.invitePeer(peerID, toSession: session, withContext: nil, timeout: 30)
        
    }
    
    
    func browser(browser: MCNearbyServiceBrowser!, lostPeer peerID: MCPeerID!) {
        
         println("lost " + peerID.displayName)
        
    }
    //////////// MARK: ADVERTISER DELEGATE ///////////
    
    func advertiser(advertiser: MCNearbyServiceAdvertiser!, didReceiveInvitationFromPeer peerID: MCPeerID!, withContext context: NSData!, invitationHandler: ((Bool, MCSession!) -> Void)!) {
        
         println("invitation from " + peerID.displayName)
        
        worldID = peerID
        
        // ACCEPTING INVITE
        invitationHandler(true,session)
        
    }
    
    
    /////////// MARK: SESSION DELEGATE ////////////////
    
    
    
    func session(session: MCSession!, didReceiveData data: NSData!, fromPeer peerID: MCPeerID!) {
        
        decidedActionWithData(data, andPeerID: peerID)
        
        
    }
    
    func session(session: MCSession!, didFinishReceivingResourceWithName resourceName: String!, fromPeer peerID: MCPeerID!, atURL localURL: NSURL!, withError error: NSError!) {
        
    }
    
    
    func session(session: MCSession!, didReceiveStream stream: NSInputStream!, withName streamName: String!, fromPeer peerID: MCPeerID!) {
        
        
        
    }
    
    func session(session: MCSession!, didStartReceivingResourceWithName resourceName: String!, fromPeer peerID: MCPeerID!, withProgress progress: NSProgress!) {
        
    }
    
    func session(session: MCSession!, peer peerID: MCPeerID!, didChangeState state: MCSessionState) {
        
        let stateArray = [
        
            "Not Connected",
            "Connecting",
            "Connected"
        
        ]
         dispatch_async(dispatch_get_main_queue(), { () -> Void in
        
        switch state {
        
        case .NotConnected :
           println("\(stateArray[state.rawValue]) to " + peerID.displayName)
            
        case  .Connecting :
            
                println("\(stateArray[state.rawValue]) to " + peerID.displayName)
            
        case .Connected :
            
            self.gameBoard?.playerJoined(peerID)
         
          }
            
         });
    }
    
    
    
    //////////////MARK: DATA HANDLING/////////
    
    func sendDataToWorld(data:NSData) {
    
        if let worldID = worldID {
        
            session?.sendData(data, toPeers: [worldID], withMode: MCSessionSendDataMode.Reliable, error: nil)
        
        }
    
    }
    
    func decidedActionWithData(data: NSData, andPeerID peerID: MCPeerID) {
    
        if let info = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil) as? [String: AnyObject] {
            
            if let action = info["action"] as? String {
            
                if action == "jump" {
                
                    gameScene?.playerJump(peerID.displayName)
                }
            
            }
            
        }
    }
}
