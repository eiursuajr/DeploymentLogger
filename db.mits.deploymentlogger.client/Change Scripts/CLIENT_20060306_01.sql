 ALTER PROCEDURE [DeleteUpdate]
(
	@UpdateID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int
	
	BEGIN TRANSACTION
	
	UPDATE LogEntry
	SET UpdateID = NULL
	WHERE UpdateID = @UpdateID

	DELETE
	FROM [Update]
	WHERE
		[UpdateID] = @UpdateID
		
	COMMIT 
	
	SET @Err = @@Error

	RETURN @Err
END