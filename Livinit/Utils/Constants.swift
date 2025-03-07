//
//  Constants.swift
//  Livinit
//
//  Created by Lareina Yang on 3/6/25.
//

// Enum to manage room types and URLs
enum RoomType {
    case livingRoom1, livingRoom2

    var url: String {
        switch self {
        case .livingRoom1:
            return "https://my.spline.design/untitled-3b52fddf0576737874ad0646f76da2d9/"
        case .livingRoom2:
            return "https://my.spline.design/livingroom2-afab216dbf3d850bacacb4aba4dedca3/"
        }
    }
}
