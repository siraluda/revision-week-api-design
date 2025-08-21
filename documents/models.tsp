namespace RevisionWeekApi.Documents;

/**
 A model used to represent the documents or files that a user uploads
 */
model Document {
  @doc("document Id")
  @visibility(Lifecycle.Read)
  id: string;

  @doc("document name")
  @visibility(Lifecycle.Read, Lifecycle.Create, Lifecycle.Update)
  fileName: string;

  @doc("type of document")
  @visibility(Lifecycle.Read, Lifecycle.Create, Lifecycle.Update)
  contentType: string;

  @doc("key used to identify the document on the cloud storage service (e.g S3 bucket)")
  @visibility(Lifecycle.Read, Lifecycle.Create, Lifecycle.Update)
  key: string;

  @doc("date document was uploaded")
  @visibility(Lifecycle.Read)
  createdAt: utcDateTime;
}

/**
 A model used to create or update the documents or files that a user has
 */
model CreateUpdateDocument is CreateOrUpdate<Document>;