//
//  Entity.swift
//  ExpenseTracker
//
//  Created by Michael Haubenstock on 1/28/16.
//  Copyright © 2016 Haubensoft, LLC. All rights reserved.
//

import Foundation

class Entity : Equatable
{
    let type : String!
    let categories : [String]!
    
    init(entityType : String, entityCategories : [String])
    {
        type = entityType
        categories = entityCategories
    }
}

func ==(lhs : Entity, rhs : Entity) -> Bool
{
    return lhs.type == rhs.type
}

class EntityParameters
{
    static let category = "category"
    static let amount = "amount"
    static let date = "date"
    static let title = "title"
    static let id = "id"
    static let type = "type"
}