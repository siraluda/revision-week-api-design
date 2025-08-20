namespace RevisionWeekApi.Models.Document;

/**
 A model used to represent the documents or files that a user uploads
 */
model Document {
  @doc("document Id")
  @visibility(Lifecycle.Read)
  id: string;

  @doc("document name")
  @visibility(Lifecycle.Create, Lifecycle.Update)
  fileName: string;

  @doc("type of document")
  @visibility(Lifecycle.Create, Lifecycle.Update)
  contentType: string;

  @doc("key used to identify the document on the cloud storage service (e.g S3 bucket)")
  @visibility(Lifecycle.Create, Lifecycle.Update)
  key: string;
}

/**
 A model used to create or update the documents or files that a user has
 */
model CreateUpdateDocument is CreateOrUpdate<Document>;
