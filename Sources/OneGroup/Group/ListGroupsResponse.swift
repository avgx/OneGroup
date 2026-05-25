import Foundation

/// Response of `GET /v1/groups/list`.
public struct ListGroupsResponse: Decodable, Equatable, Sendable {
    public let groups: [Group]
}
