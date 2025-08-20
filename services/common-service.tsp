import "@typespec/http";
import "../helpers/responseModel.tsp";
import "../helpers/errors.tsp";
import "../models/common.tsp";

using Http;
using RevisionWeekApi.Helpers.ResponseModel;
using RevisionWeekApi.Helpers.Errors;

namespace RevisionWeekApi.Services.Common;

interface CRUDService<T> {
  @get
  @list
  list(@offset skip?: int32, @pageSize limit?: int32): {
    @pageItems items: T[];
  } | ResourceNotFoundResponse | ResourceUnauthorizedResponse;

  @post
  create(@body body: T):
    | ResourceCreatedResponse<T>
    | ResourceAcceptedResponse<T>
    | ResourceErrorResponse
    | ResourceUnauthorizedResponse;

  @put
  update(@body body: T):
    | ResourceResponse<T>
    | ResourceNotFoundResponse
    | ResourceErrorResponse
    | ResourceUnauthorizedResponse
    | InternalServerErrorResponse;
}

op read<T>(
  @path id: string,
): ResourceResponse<T> | ResourceNotFoundResponse | ResourceUnauthorizedResponse;

op delete(
  @path id: string,
): ResourceNoContentResponse | ResourceUnauthorizedResponse;
