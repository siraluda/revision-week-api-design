namespace RevisionWeekApi.PracticeTests;

enum Difficulty {
  Easy,
  Medium,
  Hard,
}

model Question {
  id: string;
  practiceTestId: string;
  questionText: string;
  options: Array<string>;
  answer: string;
}

/**
 A model which represents a practice test object
 */
model Test {
  @doc("practice test id")
  @visibility(Lifecycle.Read)
  id: string;

  @doc("document id from which practice test was generated")
  @visibility(Lifecycle.Read, Lifecycle.Create)
  documentId: string;

  @doc("name of the practice test")
  @visibility(Lifecycle.Read, Lifecycle.Create)
  label: string;

  @doc("number of questions")
  @visibility(Lifecycle.Read, Lifecycle.Create)
  questionCount: numeric;

  @doc("practice test level of difficulty")
  @visibility(Lifecycle.Read, Lifecycle.Create)
  difficulty: Difficulty;

  @doc("list of questions")
  @visibility(Lifecycle.Read)
  questions: Array<Question>;

  @doc("date practice test was created")
  @visibility(Lifecycle.Read)
  createdAt: utcDateTime;
}

model CreateTest is Create<Test>;
model ReadTest is Read<Test>;

/**
 * A model used to display a list of practice tests that a user has taken. This
 * represents a user's practice test history
 */
model TestItem {
  @doc("practice test id")
  @visibility(Lifecycle.Read)
  id: string;

  @doc("name of the practice test")
  @visibility(Lifecycle.Read)
  label: string;

  @doc("number of questions")
  @visibility(Lifecycle.Read)
  questionCount: numeric;

  @doc("practice test level of difficulty")
  @visibility(Lifecycle.Read)
  difficulty: Difficulty;

  @doc("score (scaled between 0-1)")
  @visibility(Lifecycle.Read)
  score: decimal;
}
