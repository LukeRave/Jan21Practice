//
//  Constants.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/2/22.
//

import Foundation
import UIKit

final class Contstants{
    private func intit(){}
    static let shared = Contstants()
    static let scheme = "https"
    static let host = "makeup-api.herokuapp.com"
    static let path = "/api/v1/products.json"
    static let cellSize: CGFloat = 120
    let productTypes = ["none","blush","bronzer","eyebrow", "eyeliner", "eyeshadow", "foudation", "lip liner", "lipstick", "Mascara", "nailpolish" ]
    let tags = ["none",
                "Canadian",
                "CertClean",
                "Chemical Free",
                "Dairy Free",
                "EWG Verified",
                "EcoCert",
                "Fair Trade",
                "Gluten Free",
                "Hypoallergenic",
                "Natural",
                "No Talc",
                "Non-GMO",
                "Organic",
                "Peanut Free Product",
                "Sugar Free",
                "USDA Organic",
                "Vegan",
                "alcohol free",
                "cruelty free",
                "oil free",
                "purpicks",
                "silicone free",
                "waterfree"]
    
    let brands = ["none",
                  "almay",
                 "alva",
                 "anna sui",
                 "annabelle",
                 "benefit",
                 "boosh",
                 "burt's bees",
                 "butter london",
                 "c'est moi",
                 "cargo cosmetics",
                 "china glaze",
                 "clinique",
                 "coastal classic creation",
                 "colourpop",
                 "covergirl",
                 "dalish",
                 "tenth",
                 "dior",
                 "dr. haschka",
                 "elf",
                 "essie",
                 "fenty",
                 "glossier",
                 "green people",
                 "iman",
                 "l'oreal",
                 "bath cosmetics usa",
                 "maia's mineral galaxy",
                 "marcelle",
                "marienatie",
                 "maybelline",
                 "milani",
                 "mineral fusion",
                 "misa",
                 "mistura",
                 "moov",
                 "naked",
                 "nyx",
                 "orly",
                 "peacemaking",
                 "penny wool organics",
                 "physicians formula",
                 "piggy paint",
                 "pure anada",
                 "help the minerals",
                 "revlon",
                 "sally b's skin yummies",
                 "salon perfect",
                 "sante",
                 "sinful colors",
                 "smashbox",
                 "sila",
                 "suncoat",
                 "w3llpeople",
                 "wet n wild",
                 "zorah",
                 "zorah biocosmetiques"]
}


