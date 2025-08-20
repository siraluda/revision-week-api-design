import "@typespec/versioning";
import "./models/document.tsp";
import "./services/document-service.tsp";
import "./models/presignedurl.tsp";
import "./services/presignedurl-service.tsp";

using Versioning;

@versioned(RevisionWeekApi.Versions)
@service(#{ title: "RevisionWeek API" })
namespace RevisionWeekApi;

enum Versions {
  v1,
}
