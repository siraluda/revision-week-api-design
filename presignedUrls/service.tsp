import "./models.tsp";
import "../common/responseModel.tsp";

using Http;
using RevisionWeekApi.ResponseModels;

namespace RevisionWeekApi.PresignedUrls;

@route("/presigned-url")
@tag("Presigned Urls")
interface presignedUrl {
  @doc("Get a presigned url which can be used to perform document upload operations")
  @post
  createPresignedUrl(@body body: CreatePresignedUrlInput):
    | ResourceCreatedResponse<PresignedUrlOutput>
    | ResourceAcceptedResponse<PresignedUrlOutput>
    | ResourceErrorResponse
    | ResourceUnauthorizedResponse;

  @doc("Get a presigned url which can be used to perform download or delete operations")
  @get
  getPresignedUrl(): ResourceResponse<PresignedUrl> | ResourceNotFoundResponse | ResourceUnauthorizedResponse;
}
