import "@typespec/http";
import "./common-service.tsp";
import "../models/document.tsp";

using Http;
using RevisionWeekApi.Services.Common;
using RevisionWeekApi.Models.Document;

namespace RevisionWeekApi.Services.Document;

@route("/documents")
interface document extends CRUDService<CreateUpdateDocument> {
  @route("/{id}")
  @get
  getDocument is read<Document>;

  @route("/{id}")
  @delete
  deleteDocument is delete;
}
