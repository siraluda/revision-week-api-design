import "@typespec/http";
import "./models.tsp";
import "../common/responseModel.tsp";

using Http;
using RevisionWeekApi.ResponseModels;
using RevisionWeekApi.Errors;

namespace RevisionWeekApi.Documents;

// model PaginationParams {
//   @offset skip?: int32;
//   @pageSize limit?: int32;
// }

model PaginationParams {
  @query skip?: int32;
  @query limit?: int32;
}

@route("/documents")
@tag("Documents")
interface document {
  @get
  @list
  listDocuments(...PaginationParams): {
    @pageItems items: Document[];
  } | ResourceNotFoundResponse | ResourceUnauthorizedResponse;

  @post
  createDocument(@body body: CreateUpdateDocument):
    | ResourceCreatedResponse<Document>
    | ResourceAcceptedResponse<Document>
    | ResourceErrorResponse
    | ResourceUnauthorizedResponse;

  @put
  updateDocument(@body body: CreateUpdateDocument):
    | ResourceResponse<Document>
    | ResourceNotFoundResponse
    | ResourceErrorResponse
    | ResourceUnauthorizedResponse
    | InternalServerErrorResponse;

  @route("/{id}")
  @get
  getDocument(
    @path id: string,
  ): ResourceResponse<Document> | ResourceNotFoundResponse | ResourceUnauthorizedResponse;

  @route("/{id}")
  @delete
  deleteDocument(
    @path id: string,
  ): ResourceNoContentResponse | ResourceUnauthorizedResponse;
}
