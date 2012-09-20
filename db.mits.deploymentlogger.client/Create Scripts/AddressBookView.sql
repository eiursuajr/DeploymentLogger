IF EXISTS (SELECT * FROM sysobjects WHERE type = 'V' AND name = 'AddressBookView')
	BEGIN
		DROP  View AddressBookView
	END
GO

CREATE View AddressBookView AS

SELECT     dbo.AddressBook.EntryID, dbo.AddressBook.FirstName + ' ' + ISNULL(dbo.AddressBook.MiddleName + ' ', ' ') + dbo.AddressBook.LastName AS Name, 
                      dbo.AddressBook.JobTitle, dbo.AddressBook.Company, dbo.AddressBook.BusinessAddress, dbo.AddressBook.HomeAddress, 
                      dbo.AddressBook.HomePhone, dbo.AddressBook.WorkPhone, dbo.AddressBook.PrimaryEmail, dbo.AddressBook.SecondaryEmail, 
                      dbo.AddressBook.UserID, dbo.AddressBook.IsShared, dbo.[User].Login
FROM         dbo.AddressBook LEFT OUTER JOIN
                      dbo.[User] ON dbo.AddressBook.UserID = dbo.[User].UserID
                      
GO

