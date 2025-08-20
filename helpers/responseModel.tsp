import "@typespec/http";
import "./errors.tsp";

using Http;
using RevisionWeekApi.Helpers.Errors;

namespace RevisionWeekApi.Helpers.ResponseModel;

model ResourceListResponse<T> {
  ...OkResponse;
  ...Body<T[]>;
}

model ResourceResponse<T> {
  ...OkResponse;
  ...Body<T>;
}

model ResourceCreatedResponse<T> {
  ...CreatedResponse;
  ...Body<T[]>;
}

model ResourceAcceptedResponse<T> {
  ...AcceptedResponse;
  ...Body<T[]>;
}

model ResourceErrorResponse {
  ...BadRequestResponse;
  ...Body<ValidationError>;
}

model ResourceNotFoundResponse {
  ...NotFoundResponse;
  ...Body<NotFoundError>;
}

model ResourceUnauthorizedResponse {
  ...UnauthorizedResponse;
  ...Body<ValidationError>;
}

model ResourceSuccessResponse {
  ...OkResponse;
  ...Body<string>;
}

model ResourceNoContentResponse {
  ...NoContentResponse;
}
