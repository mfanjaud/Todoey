//
//  Category.swift
//  Todoey
//
//  Created by Marion FANJAUD on 04/04/2018.
//  Copyright © 2018 Marion FANJAUD. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name : String = ""
    let items = List<Item>()
}
