import "@typespec/http";
import "@typespec/versioning";
import "./documents/service.tsp";
import "./practiceTests/service.tsp";
import "./presignedUrls/service.tsp";

using Http;
using Versioning;

@versioned(RevisionWeekApi.Versions)
@service(#{ title: "RevisionWeek API" })
@server(
  "{endpoint}",
  "Revision Week API Endpoint",
  {
    endpoint: string,
  }
)
namespace RevisionWeekApi;

enum Versions {
  v1,
}
