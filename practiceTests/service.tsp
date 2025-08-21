import "@typespec/http";
import "./models.tsp";
import "../common/responseModel.tsp";

using Http;
using RevisionWeekApi.ResponseModels;

namespace RevisionWeekApi.PracticeTests;

// model PaginationParams {
//   @offset skip?: int32;
//   @pageSize limit?: int32;
// }

model PaginationParams {
  @query skip?: int32;
  @query limit?: int32;
}

@route("/practice-tests")
@tag("Practice Tests")
interface practiceTest {
  @get
  @list
  listPracticeTests(...PaginationParams): {
    @pageItems items: TestItem[];
  } | ResourceNotFoundResponse | ResourceUnauthorizedResponse;

  @post
  createPracticeTest(
    @body body: CreateTest,
  ): ResourceCreatedResponse<Test> | ResourceErrorResponse | ResourceUnauthorizedResponse;

  @route("/{id}")
  @get
  getPracticeTest(
    @path id: string,
  ): ResourceResponse<ReadTest> | ResourceNotFoundResponse | ResourceUnauthorizedResponse;

  @route("/{id}")
  @delete
  deletePracticeTest(
    @path id: string,
  ): ResourceNoContentResponse | ResourceUnauthorizedResponse;
}
