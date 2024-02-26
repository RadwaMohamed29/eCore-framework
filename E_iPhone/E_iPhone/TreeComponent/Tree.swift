//
//  Tree.swift
//  E_iPhone
//
//  Created by Alaa on 26/02/2024.
//

import Foundation


struct Tree: Codable, Hashable {
    
    static func == (lhs: Tree, rhs: Tree) -> Bool {
        lhs.structID == rhs.structID
    }
    
    let structDesc: String
    let childnodecount: Int
    let structID: String

    enum CodingKeys: String, CodingKey {
        case structDesc = "STRUCT_DESC"
        case childnodecount = "CHILDNODECOUNT"
        case structID = "STRUCT_ID"
    }
}


extension Tree {
    
    static func getRoot() -> [Tree] {
        
        return [
            
            Tree(structDesc: "parent1", childnodecount: 5, structID: "7i7n6NmWyDw")
            ,
            Tree(structDesc: "parent2", childnodecount: 0, structID: "7i7n6NmWyDw2")
            ,
            Tree(structDesc: "parent3", childnodecount: 0, structID: "7i7n6NmWyDwt")
            
        ]
        
    }
    
    
    static func getChild(structID: String) -> [Tree] {
        
        if structID == "7i7n6NmWyDw" {
            return [
                
                Tree(structDesc: "child1", childnodecount: 5, structID: "UE6Dji5SIPE%3d21")
                ,
                Tree(structDesc: "child2", childnodecount: 0, structID: "UE6Dji5SIPE%3d22")
            ]
        } else if structID == "UE6Dji5SIPE%3d21" {
            return [
                
                Tree(structDesc: "child1", childnodecount: 5, structID: "UE6Dji5SIPE%3d23")
                ,
                Tree(structDesc: "child2", childnodecount: 0, structID: "UE6Dji5SIPE%3d24")
            ]
        } else if structID == "UE6Dji5SIPE%3d23" {
            return [
                
                Tree(structDesc: "child1", childnodecount: 5, structID: "UE6Dji5SIPE%3d25")
                ,
                Tree(structDesc: "child2", childnodecount: 0, structID: "UE6Dji5SIPE%3d26")
            ]
        } else if structID == "UE6Dji5SIPE%3d25" {
            return [
                
                Tree(structDesc: "child1", childnodecount: 5, structID: "UE6Dji5SIPE%3d27")
                ,
                Tree(structDesc: "child2", childnodecount: 0, structID: "UE6Dji5SIPE%3d28")
            ]
        } else if structID == "UE6Dji5SIPE%3d27" {
            return [
                
                Tree(structDesc: "child1", childnodecount: 5, structID: "UE6Dji5SIPE%3d29")
                ,
                Tree(structDesc: "child2", childnodecount: 0, structID: "UE6Dji5SIPE%3d30")
            ]
        } else {
            return []
        }

        
    }

}





   



