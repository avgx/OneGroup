import Foundation
import OneWireFormat

extension Group {
    /// Whether this node is the documented default group id.
    public var isDefaultGroup: Bool {
        groupId == GroupID.defaultGroupID
    }
}
