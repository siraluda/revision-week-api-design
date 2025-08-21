import "@typespec/http";
import "./errors.tsp";

using Http;
using RevisionWeekApi.Errors;

namespace RevisionWeekApi.ResponseModels;

model ResourceListResponse<T> {
  ...OkResponse;
  @bodyRoot bodyContent: T[];
}

model ResourceResponse<T> {
  ...OkResponse;
  @bodyRoot bodyContent: T;
}

model ResourceCreatedResponse<T> {
  ...CreatedResponse;
  @bodyRoot bodyContent: T;
}

model ResourceAcceptedResponse<T> {
  ...AcceptedResponse;
  @bodyRoot bodyContent: T;
}

model ResourceErrorResponse {
  ...BadRequestResponse;
  @bodyRoot bodyContent: ValidationError;
}

model ResourceNotFoundResponse {
  ...NotFoundResponse;
  @bodyRoot bodyContent: NotFoundError;
}

model ResourceUnauthorizedResponse {
  ...UnauthorizedResponse;
  @bodyRoot bodyContent: UnauthorizedError;
}

model ResourceSuccessResponse {
  ...OkResponse;
  @bodyRoot bodyContent: string;
}

model ResourceNoContentResponse {
  ...NoContentResponse;
}
