CREATE PROCEDURE LogEntryStatusChangedToTested
	(
	@NotificationTypeID	int,
	@ProjectID			int,
	@UpdateID			int,
	@LogEntryID			int
	)
AS 
	
DECLARE @ProjectName	varchar(255)
DECLARE @UpdateName		varchar(255)
DECLARE @LogEntryName	varchar(255)

	IF ISNULL(@LogEntryID, 0) <> 0
	BEGIN
		IF ISNULL(@UpdateID, 0) = 0
		BEGIN
			SELECT @UpdateID = UpdateID
			FROM LogEntry
			WHERE LogEntryID = @LogEntryID
		END
		
		IF ISNULL(@ProjectID, 0) = 0
		BEGIN
			SELECT @ProjectID = ProjectID
			FROM [Update]
			WHERE UpdateID = @UpdateID
		END
	END
	
	SELECT @ProjectName = Name
	FROM Project
	WHERE ProjectID = @ProjectID
	
	SELECT @UpdateName = Name
	FROM [Update]
	WHERE UpdateID = @UpdateID
	
	SELECT @LogEntryName = Header
	FROM LogEntry
	WHERE LogEntryID = @LogEntryID

	INSERT INTO Notification (NotificationTypeID, ProjectID, Header, Description, DateCreated)
	VALUES(@NotificationTypeID, @ProjectID, 'Log Entry was tested', 'Log Entry was tested and ready to be reviewed by the Project Manager.\n\n Additional Information: \n\n Project: ' + @ProjectName + '\nUpdate: ' + @UpdateName + '\nLog Entry: ' + @LogEntryName, GETDATE())
	
	RETURN	
