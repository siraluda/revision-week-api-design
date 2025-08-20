import "@typespec/http";
import "./common-service.tsp";
import "../models/presignedurl.tsp";
import "../helpers/responseModel.tsp";

using Http;
using RevisionWeekApi.Services.Common;
using RevisionWeekApi.Helpers.ResponseModel;
using RevisionWeekApi.Models.PresignedUrl;

@route("/presigned-url")
interface presignedUrl {
  @doc("Get a presigned url which can be used to perform document upload operations")
  @post
  create(@body body: CreatePresignedUrlInput):
    | ResourceCreatedResponse<PresignedUrlOutput>
    | ResourceAcceptedResponse<PresignedUrlOutput>
    | ResourceErrorResponse
    | ResourceUnauthorizedResponse;

  @doc("Get a presigned url which can be used to perform download or delete operations")
  @route("/{id}")
  @get
  getPresignedUrl is read<PresignedUrl>;
}
