import Foundation
import OneWireFormat

/// Flattened group entry with breadcrumb path for UI lists.
public struct FlatGroup: Equatable, Sendable, Identifiable {
    public let id: GroupID
    public let name: String
    public let path: [String]

    public init(id: GroupID, name: String, path: [String]) {
        self.id = id
        self.name = name
        self.path = path
    }
}

extension Group {
    /// Flattens this node and descendants into breadcrumb rows.
    public func flattened(path: [String] = []) -> [FlatGroup] {
        let currentPath = path + [name.trimmingCharacters(in: .whitespacesAndNewlines)]
        let current = FlatGroup(id: groupId, name: name, path: currentPath)

        guard !groups.isEmpty else {
            return [current]
        }

        return [current] + groups.flatMap { $0.flattened(path: currentPath) }
    }

    /// This group id and all descendant group ids.
    public var allGroupIDs: [GroupID] {
        [groupId] + groups.flatMap(\.allGroupIDs)
    }
}

extension ListGroupsResponse {
    /// All groups in the tree as flat breadcrumb rows.
    public var flatGroups: [FlatGroup] {
        groups.flatMap { $0.flattened() }
    }
}
