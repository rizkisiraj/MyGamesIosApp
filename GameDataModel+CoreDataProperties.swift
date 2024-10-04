//
//  GameDataModel+CoreDataProperties.swift
//  MyGames
//
//  Created by Rizki Siraj on 04/10/24.
//
//

import Foundation
import CoreData


extension GameDataModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GameDataModel> {
        return NSFetchRequest<GameDataModel>(entityName: "GameDataModel")
    }

    @NSManaged public var title: String?
    @NSManaged public var released: Date?
    @NSManaged public var background_image: String?
    @NSManaged public var id: Int64
    @NSManaged public var genre: String?

}

extension GameDataModel : Identifiable {

}
