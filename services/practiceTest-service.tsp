import "@typespec/http";
import "./common-service.tsp";
import "../models/practiceTest.tsp";
import "../helpers/responseModel.tsp";

using Http;
using RevisionWeekApi.Services.Common;
using RevisionWeekApi.Models.PracticeTest;
using RevisionWeekApi.Helpers.ResponseModel;

namespace RevisionWeekApi.Services.PracticeTest;

@route("/practice-tests")
interface practiceTest {
  @get
  @list
  list(@offset skip?: int32, @pageSize limit?: int32): {
    @pageItems items: TestItem[];
  } | ResourceNotFoundResponse | ResourceUnauthorizedResponse;

  @post
  create(
    @body body: CreateTest,
  ): ResourceCreatedResponse<Test> | ResourceErrorResponse | ResourceUnauthorizedResponse;

  @route("/{id}")
  @get
  getPracticeTest is read<ReadTest>;

  @route("/{id}")
  @delete
  deletePracticeTest is delete;
}
