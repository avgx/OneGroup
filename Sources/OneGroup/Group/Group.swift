import Foundation
import OneWireFormat

/// VMS camera group node (`GroupManager.Group`).
public struct Group: Decodable, Equatable, Sendable, Identifiable {
    public let groupId: GroupID
    public let name: String
    public let description: String
    public let parent: GroupID
    public let groups: [Group]

    public var id: GroupID { groupId }

    private enum CodingKeys: String, CodingKey {
        case groupId = "group_id"
        case name
        case description
        case parent
        case groups
    }
}
