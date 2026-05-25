# OneGroup

Swift package for Native BL **VMS camera groups** (`GroupManager.proto`) and `GET /v1/groups/list`.

**Platforms:** iOS 15+, macOS 13+, tvOS 17+, visionOS 1+  
**Swift tools:** 6.1+

## Dependencies

| Package | Role |
|---------|------|
| [RequestResponse](https://github.com/avgx/RequestResponse) | `GroupApi.list()` → `Request<ListGroupsResponse>` |
| [OneWireFormat](https://github.com/avgx/OneWireFormat) | `GroupID`, `GroupID.defaultGroupID` |

## API

| API | Method | HTTP | Response |
|-----|--------|------|----------|
| `GroupApi.list(view:)` | GET | `v1/groups/list?view=VIEW_MODE_TREE` | `ListGroupsResponse` |


Proto: [`GroupManager.proto`](https://github.com/jerrygergov/axxon-telegram-vms/blob/main/support/protos/axxonsoft/bl/groups/GroupManager.proto)


## Tree helpers

```swift
import OneGroup

let response: ListGroupsResponse = ...
let flat = response.flatGroups // [FlatGroup] with breadcrumb paths

for group in flat {
    // group.id, group.name, group.path
}

let ids = response.groups[0].allGroupIDs // self + descendants
```

Camera filtering (app layer): `camera.groupIds.contains(selectedGroupId)`.

## Usage

```swift
let request = GroupApi.list(view: .tree)
```

## Module layout

```
Sources/OneGroup/
├── API/           GroupApi, GroupViewMode
├── Group/         Group, ListGroupsResponse
└── Tree/          FlatGroup, flattened(), isDefaultGroup
```

## Tests

```bash
swift test
```
