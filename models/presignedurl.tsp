namespace RevisionWeekApi.Models.PresignedUrl;

/**
 Input model used to create a presigned url for a document/file
 */
model CreatePresignedUrlInput {
  @doc("name of the file")
  filename: string;

  @doc("the type of file")
  contentType: string;
}

/**
 Output model when a presigned url is created
 */
model PresignedUrlOutput {
  @doc("The presigned url created for the document/file which is used for the upload operation")
  url: string;

  @doc("key to the uploaded file on cloud storage (e.g. S3 bucket key)")
  key: string;
}

/**
 A presigned url model
 */
model PresignedUrl {
  @doc("a presigned url for a file which can be used for download or delete operations")
  url: string;
}
