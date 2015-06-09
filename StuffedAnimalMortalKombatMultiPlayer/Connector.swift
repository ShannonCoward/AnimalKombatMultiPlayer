//
//  Connector.swift
//  StuffedAnimalMortalKombatMultiPlayer
//
//  Created by Shannon Armon on 6/9/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit
import MultipeerConnectivity

private let serviceType = "StuffedAnimalMortalKombat"

private let _singleton = Connector()

class Connector: NSObject, MCSessionDelegate, MCNearbyServiceAdvertiserDelegate, MCNearbyServiceBrowserDelegate {
   
    class func sharedConnector() -> Connector { return _singleton }
    
    var browser: MCNearbyServiceBrowser? // for iPad
    var advertiser: MCNearbyServiceAdvertiser? //for iphone
    
    var session: MCSession?
    
    var myPeerID: MCPeerID?
    
    var myInfo: [String:AnyObject] = [:]
    
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
        
        advertiser?.startAdvertisingPeer()
    }
    //////////// MARK: BROWSER DELEGATE
    
    func browser(browser: MCNearbyServiceBrowser!, foundPeer peerID: MCPeerID!, withDiscoveryInfo info: [NSObject : AnyObject]!) {
        
    }
    
    
    func browser(browser: MCNearbyServiceBrowser!, lostPeer peerID: MCPeerID!) {
        
    }
    //////////// MARK: ADVERTISER DELEGATE ///////////
    
    func advertiser(advertiser: MCNearbyServiceAdvertiser!, didReceiveInvitationFromPeer peerID: MCPeerID!, withContext context: NSData!, invitationHandler: ((Bool, MCSession!) -> Void)!) {
        
    }
    
    
    /////////// MARK: SESSION DELEGATE ////////////////
    
    func session(session: MCSession!, didFinishReceivingResourceWithName resourceName: String!, fromPeer peerID: MCPeerID!, atURL localURL: NSURL!, withError error: NSError!) {
        
    }
    
    func session(session: MCSession!, didReceiveData data: NSData!, fromPeer peerID: MCPeerID!) {
        
    }
    
    func session(session: MCSession!, didReceiveStream stream: NSInputStream!, withName streamName: String!, fromPeer peerID: MCPeerID!) {
        
    }
    
    func session(session: MCSession!, didStartReceivingResourceWithName resourceName: String!, fromPeer peerID: MCPeerID!, withProgress progress: NSProgress!) {
        
    }
    
    func session(session: MCSession!, peer peerID: MCPeerID!, didChangeState state: MCSessionState) {
        
        
    }
    
}
