import Foundation
import RequestResponse

/// Group API (Native BL `v1/groups/*`).
///
/// Source: `GroupManager.proto` (`GroupService`).
public enum GroupApi {
    /// Endpoint: `GET /v1/groups/list`
    ///
    /// Returns the VMS camera group tree. Not the legacy `GET /group` PascalCase API.
    public static func list(view: GroupViewMode = .tree) -> Request<ListGroupsResponse> {
        Request(
            path: "v1/groups/list",
            method: .get,
            query: [("view", view.rawValue)]
        )
    }
}
