import Foundation
import OneWireFormat
import Testing
@testable import OneGroup

@Suite("Group decoding")
struct GroupDecodingTests {
    @Test("decode ListGroupsResponse from fixture")
    func listGroups() throws {
        let response = try FixtureLoader.decode(ListGroupsResponse.self, resource: "groups_tree")
        #expect(response.groups.count == 1)
        #expect(response.groups[0].groupId == GroupID.defaultGroupID)
        #expect(response.groups[0].isDefaultGroup)
        #expect(response.groups[0].groups.count == 2)
    }
}

@Suite("Group tree helpers")
struct GroupTreeTests {
    @Test("flattened produces breadcrumb paths")
    func flattened() throws {
        let response = try FixtureLoader.decode(ListGroupsResponse.self, resource: "groups_tree")
        let flat = response.flatGroups

        #expect(flat.count == 4)
        #expect(flat[0].path == ["Default"])
        #expect(flat[1].path == ["Default", "Building A"])
        #expect(flat[3].path == ["Default", "Building B", "Floor 1"])
    }

    @Test("allGroupIDs includes descendants")
    func allGroupIDs() throws {
        let response = try FixtureLoader.decode(ListGroupsResponse.self, resource: "groups_tree")
        let root = try #require(response.groups.first)

        let ids = Set(root.allGroupIDs)
        #expect(ids.contains(GroupID.defaultGroupID))
        #expect(ids.contains("0296bda9-c54b-a946-8374-85aa07f52f77"))
        #expect(ids.count == 4)
    }
}
