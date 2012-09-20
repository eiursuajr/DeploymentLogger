ALTER PROCEDURE dbo.LogEntryStatusChanged
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
DECLARE @NotificationEmailDefaultHeader			varchar(1024)
DECLARE @NotificationEmailDefaultDescription	varchar(8000)

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
	
	SELECT @NotificationEmailDefaultHeader = NotificationEmailDefaultHeader,
		@NotificationEmailDefaultDescription = NotificationEmailDefaultDescription
	FROM NotificationType
	WHERE NotificationTypeID = @NotificationTypeID

	INSERT INTO Notification (NotificationTypeID, ProjectID, Header, Description, DateCreated)
	VALUES(@NotificationTypeID, @ProjectID, ISNULL(@NotificationEmailDefaultHeader, ''), ISNULL(@NotificationEmailDefaultDescription, '') + '\n\n Additional Information: \n\n Project: ' + ISNULL(@ProjectName, '') + '\nUpdate: ' + ISNULL(@UpdateName, '') + '\nLog Entry: ' + ISNULL(@LogEntryName, ''), GETDATE())
	
	RETURN

 